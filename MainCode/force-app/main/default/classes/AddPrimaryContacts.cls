public class AddPrimaryContacts implements Queueable {
 Private contact cont;   
 Private String State;
    public void AddPrimaryContact (contact records, string BT )
    {
         this.cont = records;
        this.state = BT;   
    }
    public void execute( Queueablecontext qc)
    {
        
        list <Account> Accounts = [select id,name,(select id,name from contacts) from Account where billingstate = : State 
                                  limit 200];
            list <contact> contacts = new list <contact>();
        for( account acct : accounts)
        {
           contact C = cont.clone(false,false,false,false);
            C.AccountId = acct.id;
            contacts.add(c);
         if(contacts.size()> 0)
            {
              insert contacts;  
            }
        }
       
    }
}