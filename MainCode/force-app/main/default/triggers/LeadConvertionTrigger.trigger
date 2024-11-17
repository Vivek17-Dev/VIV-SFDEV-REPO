trigger LeadConvertionTrigger on Lead (after update)
{
   
   list<loan_account__c> LoanAcc = new list<loan_account__c>();
  for(lead L:trigger.new)
  {
      
      if(l.IsConverted)
      {  
          loan_account__c La = new loan_account__c();
       
        la.Account_Number__c = l.Account_Number__c;
          la.company_name__c = l.convertedAccountId;
          la.PAN_Number__c =  l.PAN_Number__c;
           la.Loan_amount__c = l.Loan_Amount__c;
           la.Address__c = l.Street+ ',' +l.City+ ',' +l.Country+ ',' +l.PostalCode;
        // la.Point_of_Contact__c = l.ConvertedContactId;
                la.Name = l.FirstName+''
                +l.LastName;
            loanAcc.add(LA); 
      }
    if(loanAcc.size()>0)
         {
            insert loanAcc;
        }
    }

    
}