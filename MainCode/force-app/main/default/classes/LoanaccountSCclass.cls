global class LoanaccountSCclass implements Schedulable {
    global void execute(schedulablecontext ctx)
    {
        list<lead> leads = [select id,name,PAN_number__c,Account_number__c,firstName,LastName,loan_amount__c from lead where Isconverted = false AND createdDate = today];
        for(lead L:leads)
        {
            if(l.Loan_Amount__c>500000)
            {
                LeadStatus convertStatus = [SELECT Id, MasterLabel
                FROM LeadStatus WHERE IsConverted=true LIMIT 1];
                List<Database.LeadConvert> leadConversions = new List<Database.LeadConvert>();
                   Database.LeadConvert lc = new database.LeadConvert();
                   lc.setLeadId( Leads[0].id );
                   lc.setConvertedStatus( convertStatus.MasterLabel );
                  Leadconversions.add(lc);
                
               list <Database.LeadConvertResult> results = Database.convertLead(leadconversions);
                System.assert(results[0].isSuccess());
                //System.assert(results[1].isSuccess());


            }
            
        }
    }
}