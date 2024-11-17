@isTest
 public class AccountProcessorTest {
     @isTest  static void CountContactTest()
     { 
         list <id> recordIds = new list<id>();
         list <Account> ACCT = new List<Account>();
         Account A1 = new Account(Name = 'Vivek Rajak');
         ACCT.add(A1);
         Account A2 = new Account(Name = 'Vivek Kumar Rajak');
         ACCT.add(A2);         
         insert ACCT;
         list<Contact> Con = new list<contact>(); 
         contact c1 = new contact(AccountId = A1.Id, LastName = 'Rajak');
         Con.add(c1);
         contact c2 = new contact(AccountId = A2.Id,LastName = 'Rajak');
         Con.add(c2);
         insert Con;
         for (account acc : ACCT)
         {
             recordIds.add(acc.id);
            
         }
         test.startTest();
         accountProcessor.countContacts(recordIds);
         test.stopTest();
         system.assertEquals(2, [select count() from account where number_of_contacts__c = 1]);
     }

}