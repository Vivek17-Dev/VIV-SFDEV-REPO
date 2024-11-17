public class AccountUtils{
    public static List<Account> accountsByState(String st)
    {
       List<account> acclist = [select id,name from account where BillingState =: st];
        system.debug('Aclsit '+ accList);
        return acclist;
	}
}