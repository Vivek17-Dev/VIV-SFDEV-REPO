global class LoanAccountBatchClass implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
      return Database.getQueryLocator('select id,firstname,lastname,convertedAccountId,loan_amount__c,account_number__c,address,'+
                                      'email,convertedContactId,city,country,state,PostalCode,street,PAN_number__c from lead where Isconverted = true AND createdDate = today'); 
    }
    global void execute(Database.BatchableContext bc, List<lead> leads)
    {
        list <loan_account__c> loanAcc = new list<loan_account__c>();
        system.debug('dfsre' + leads);
        for(lead l:leads)
        {
        
            
            
            loan_account__c la = new loan_account__c();
            la.Account_Number__c = l.Account_Number__c;
            la.company_name__c = l.convertedAccountId;
            la.PAN_Number__c =  l.PAN_Number__c;
            la.Loan_amount__c = l.Loan_Amount__c;
            la.Address__c = l.Street+ ',' +l.City+ ',' +l.Country+ ',' +l.PostalCode;
           la.Applicant__c = l.ConvertedContactId;
             la.Name = l.FirstName+''+l.LastName;
                loanAcc.add(LA); 
            
        }
        insert loanAcc;
        
    }    
    global void finish(Database.BatchableContext bc){
        
    }    
}

/*public class Leadconversion implements Database.Batchable<sObject>
{
    Map<id,Lead> idMap=new Map<id,Lead>();
    
    public Leadconversion(Map<id,Lead> leadIds)
    {
        idMap=leadIds;
    }
    
    
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
       return Database.getQueryLocator([SELECT id,name,email,PAN_Number__c,Loan_Amount__c,street,city,country,state,postalCode,convertedContactId,convertedAccountId,Account_Number__c from Lead where id in:idMap.keySet()]);
    }
    
    public static void execute(Database.BatchableContext bc,List<Lead> newLeads)
    {
        List<Loan_Account__c> loanAccounts=new List<Loan_Account__c>();
        LeadStatus convertStatus = [SELECT Id, MasterLabel, IsConverted FROM LeadStatus WHERE IsConverted=true limit 1];
        
        Try{
            for(lead lead :newLeads)
            {
                loan_account__c loanAcc=new loan_account__c();
                loanAcc.Name=lead.firstName+','+lead.lastName;
                loanAcc.Address__c=lead.Street+','+lead.City+','+lead.State+','+lead.Country+'-'+lead.PostalCode;
                loanAcc.Point_of_contact__c=lead.ConvertedContactId;
                loanAcc.Company_Name__c=lead.ConvertedAccountId;
                loanAcc.Email__c=lead.Email;
                loanAcc.Account_Number__c=lead.Account_Number__c;
                loanAcc.Loan_amount__c=lead.Loan_Amount__c;
                loanAcc.PAN_Number__c=lead.PAN_Number__c;
                loanAccounts.add(loanAcc);
            }
                if(!loanAccounts.isEmpty())
              {
                insert loanAccounts;
              }
         }
         catch (Exception e)
        {
            system.debug('LineNumber : '+e.getLineNumber()+' -- Exception Message : '+e.getMessage());
        }
        
    }
    
    public static void finish(Database.BatchableContext bc)
    { }
}*/