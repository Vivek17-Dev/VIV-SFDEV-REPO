trigger LeadConvertTrigger on Lead (after update) {
 
    Map<id,Lead> recordIdsMap =new Map<id,Lead>();
    
    for(Lead lead:System.Trigger.new) {
  if(Lead.IsConverted)
  {
      recordIdsMap.put(lead.id,lead);
      //Leadconversion.createLoanAccount(Trigger.new);
  }
        if(recordIdsMap.size() > 0)
        {
         //Leadconversion leadConvrt=new Leadconversion(recordIdsMap);
         // Id batchId=Database.executeBatch(leadConvrt,10);
        //Database.executeBatch(new Leadconversion(recordIdsMap),10);
        }
 
 }
}