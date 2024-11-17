Global class OpportunityRoundRobin Implements Database.Batchable<Sobject> {
    
    Global Database.QueryLocator start(Database.BatchableContext BC){
        
        string Query = 'Select id, name, OwnerId from Opportunity where ownerid != null';
        
       return Database.getQueryLocator(Query);
    }
    
    Global void execute(Database.BatchableContext BC, List<opportunity> OppList){
        system.debug('OppList ' + OppList.size());
        List<user> usrList = [Select id, name, isActive from user where isActive != false limit 5];
        Integer index = usrList.size();
        List<opportunity> UpdateOpp = new List<opportunity>();
        Map<id, id> UserOppMap = new  Map<id, id>();
        system.debug('index ' + index);
        if(OppList.size()>0){
        for(integer i =0; i<OppList.size(); i++)
        {
            if(usrList.size()>0) 
            {
             system.debug(Math.mod(i, index));  
              UserOppMap.put( OppList[i].id, usrList[Math.mod(i, index)].id); 
             OppList[i].ownerid =  usrList[Math.mod(i, index)].id;
            }
       UpdateOpp.add(OppList[i]);
        }
            system.debug('UserOppMap '+ UserOppMap);
            system.debug(UpdateOpp);
       Database.update(UpdateOpp, false);
        }
    }
    
Global Void Finish(Database.BatchableContext BC){
    
}

}