public class AccountContactSearch {

@AuraEnabled(cacheable=true)
public static List<Account> getAccounts() {
    List<Account> accList = new List<Account>();
    for(Account acc: [SELECT Id,Name,AccountNumber FROM Account LIMIT 100] ){
        accList.add(acc);
    }
   
   return accList;
 }
@AuraEnabled(cacheable=true)
public static List<Contact> getContacts(string accountId) {
    List<Contact> conList = new List<Contact>();
    for(Contact con: [SELECT Name, Account.name, email, phone FROM Contact where accountID =: accountid] ){
        conList.add(con);
    }
   
   return conList;
 }

}