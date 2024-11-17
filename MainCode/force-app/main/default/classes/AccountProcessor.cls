public class AccountProcessor 
{
    @future
    public static void countContacts(list<Id> recordIds)
    {
        list <account> Acct = new List <account> ();
        Acct  =  [Select id, Number_of_Contacts__c from account Where ID IN :recordIds];
        list <Contact> cont = new List <Contact> ();
        cont =   [select id from contact  where AccountId =  :recordIds];
        Integer ListSize = Cont.size();
        for(account acc : Acct){
            Acc.Number_of_Contacts__c = listSize;
        }
        if(Acct.size()>0){
            update Acct ;  
        }
    }
}