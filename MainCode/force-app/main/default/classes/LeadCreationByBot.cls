public with sharing class LeadCreationByBot 
{
    public class LogInput{
      @InvocableVariable(required=false)
       public String sCurrentcontact;
       //@InvocableVariable(required=false)
      // public String sLiveAgentTranscriptId;
   }
         @InvocableMethod(label='Lead Creation')
         public static void leadCreation(List<LogInput> inputParameters)
   { 
         String sCurrentcontact = inputParameters[0].sCurrentcontact;
        // String sLiveAgentTranscriptId = inputParameters[0].sLiveAgentTranscriptId;

 
      //Create a new Utterance lead record
       lead leadRecord = new lead();
 
       // Store the utterance
       
       leadRecord.Phone = sCurrentcontact;
       leadRecord.Company = 'Accenture';
       leadRecord.Status = 'Open-Not Contacted';
       leadRecord.LastName = 'Manish Sawla';
       leadRecord.Email = 'manish.sawla@yahoo.com';
       
      // leadRecord.Chat_Transcript__c = sLiveAgentTranscriptId;
       
       // Save the log utterance record to our org
       insert leadRecord;
       system.debug('success');
   }
    
}