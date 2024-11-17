public with sharing class CookbookBot_LogUtterance 
{
    public class LogInput{
      @InvocableVariable(required=false)
       public String sCurrentUtterance;
       @InvocableVariable(required=false)
       public String sLiveAgentTranscriptId;
   }
         @InvocableMethod(label='Log Utterance')
         public static void logUtterance(List<LogInput> inputParameters)
   { 
         String sCurrentUtterance = inputParameters[0].sCurrentUtterance;
         String sLiveAgentTranscriptId = inputParameters[0].sLiveAgentTranscriptId;

 
      //Create a new Utterance Log record
       Utterance_Log__c logRecord = new Utterance_Log__c();
 
       // Store the utterance
       
       logRecord.CurrentUtterance__c = sCurrentUtterance;
       logRecord.Chat_Transcript__c = sLiveAgentTranscriptId;
       
       // Save the log utterance record to our org
       insert logRecord;
       system.debug('success');
   }
    
}