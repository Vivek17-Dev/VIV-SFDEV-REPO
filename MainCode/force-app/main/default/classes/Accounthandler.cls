public class Accounthandler {
    public static void insertAccount(integer  accCount)
    {
    List<Account> addAccounts = new List<Account>();
        
        Integer n = 1;
        While(n<= accCount)
        {
            Account a = new Account();
            a.Name = 'Acme Inc '+ n;
            a.AccountNumber = 'A000'+n;
            addAccounts.add(a);
            n = n+1;
        }
        insert addAccounts;
       system.debug('addAccounts' + addAccounts);
        //return addAccounts;
    }

}