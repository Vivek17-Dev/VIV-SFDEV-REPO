@istest
private class LASCtest
{
  static testmethod void testLASC()
 {
   
   
   
       lead L = new lead(lastName = 'last',FirstName = 'first',company ='Asd',Status = 'converted',Account_number__c ='56432178901',loan_amount__c=4500000); 
        
   
       insert l;
     test.startTest();
     loanaccountSCclass lasc = new loanaccountSCclass();
     string sch = '20 0 3 31 3 ?';
     string jobID = system.schedule('jobNamelasc', sch, lasc);
     
     system.assertEquals(1, [select count() from lead where account_number__c ='56432178901']);
     test.stopTest();
 }

}