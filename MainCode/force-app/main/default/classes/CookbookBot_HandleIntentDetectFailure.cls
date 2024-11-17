public with sharing class CookbookBot_HandleIntentDetectFailure {


   public class HandleInput {
       @InvocableVariable(required=false)
       public String sCurrentUtterance;
       @InvocableVariable(required=false)
       public String sLiveChatTranscriptId;
   }
   public class HandleOutput {

      @InvocableVariable(required=false)
       public String sTransferMessage;
       @InvocableVariable(required=false)
       public Boolean bTransferRequired;

   }
   @InvocableMethod(label='Handle Intent Detection Failure')
   public static List<handleOutput> handleIntentDetectionFailure(List<HandleInput> inputParameters) {
       String sCurrentUtterance = inputParameters[0].sCurrentUtterance;
       String sLiveChatTranscriptId = inputParameters[0].sLiveChatTranscriptId;
       // Create default output values
       // 
       List<HandleOutput> outputParameters = new List<HandleOutput>();
       HandleOutput outputParameter = new HandleOutput();
       outputParameter.bTransferRequired = false;
       outputParameter.sTransferMessage = '';
      
       // Find undetected utterances from this session
       List<Utterance_Log__c> undetectedUtterances = [SELECT CurrentUtterance__c, CreatedDate
                                                      FROM Utterance_Log__c
                                                      WHERE Chat_Transcript__c = :sLiveChatTranscriptId
                                                     ORDER BY CreatedDate Desc];
         String value = System.Label.msg;
       
       // Have we had more than two undetected utterances?
       if (undetectedUtterances.size() >= 2)
       {
           // Have we had more than five?
           //if (undetectedUtterances.size() > 5)
         //  {
               // If so, then automatically suggest a transfer...
               outputParameter.bTransferRequired = true;
               outputParameter.sTransferMessage = value;
          // }
           // If less than five...
         // else
// {
              // Grab the most recent two utterances
              // Utterance_Log__c thisUtterance = undetectedUtterances[0];
             //  Utterance_Log__c lastUtterance = undetectedUtterances[1];

               // If they happened within the past 20 seconds...
              // if (thisUtterance.CreatedDate < lastUtterance.CreatedDate.addSeconds(20))
              // {
                   // Then suggest a transfer...
                  // outputParameter.bTransferRequired = true;
                   //outputParameter.sTransferMessage =
                     //'I\'m having troubles understanding what you need. Let me find a specialist.';

              // }
         // }
       }
       outputParameters.add(outputParameter);      
       return outputParameters;
  }
}