public class LetsDoDML {
    
    public static void DMLAction()
    {
        list<contact> conList = new List<contact>();
        list<account> AccList = new List<account>();
        List<Decimal> SSN = new List<Decimal>();
        for(integer i=0; i<3; i++){
            account a = new account(name = 'Mahima'+ i);
            AccList.add(a);
        }
        
        Insert AccList;
        
        for(integer i=0; i < 6; i++)
        {
           contact c = new contact();
            c.FirstName = 'Mahima';
            c.LastName = 'Shakya';
            c.SSN__c = 123456780+i;
            if(i<3){
                c.AccountId = AccList[i].id;
            }
            else if(i==3){
                 c.AccountId = AccList[0].id;
            }
            else{
                c.AccountId = AccList[1].id;
            }
            SSN.add(c.SSN__c);
            conList.add(c);
        }
        
        Insert conList;
        
        Map<id, Decimal> ConSSN = new Map<id, Decimal>();
        
        for(contact c: [select id, SSN__c from contact where SSN__c In: SSN ])
        {
            ConSSN.put(c.id, c.SSN__C);
            
            system.debug('ConSSN' + ConSSN);
        }
    }

}