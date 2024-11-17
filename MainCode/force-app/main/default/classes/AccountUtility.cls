public class AccountUtility{
    public static void viewAnnualRevenue()
    {
        List<Account> accountsList = [select id,Name,AnnualRevenue from Account];
        for(account a: accountsList)
        {
            string acctRev = '';
            acctRev = a.name + ':'+ a.AnnualRevenue;
            system.debug(acctRev);
        }
    }
}