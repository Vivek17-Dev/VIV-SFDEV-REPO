@IsTest
Private class ContactRollupTriggerHandlerTest {

    static testmethod void setup()
    {
        List<account> Acclist = new List<account>();
        List<contact> conlist = new List<contact>();
        for(integer i=0; i<200; i++)
        {
            Account a = new account(Name = 'acn' +i, First_Name__c = 'acv'+i, Last_Name__c = 'acr'+i);
            Acclist.add(a);
        }
        Insert Acclist;
        for(account a :Acclist)
        {    for(integer i=0; i<5; i++){
            contact c = new contact(LastName = 'cont'+i, AccountID = a.Id, Minimum_Date__c = Date.today().adddays(i));
            conlist.add(c);
                }
        }
        Insert conlist;
        
        
    }
}