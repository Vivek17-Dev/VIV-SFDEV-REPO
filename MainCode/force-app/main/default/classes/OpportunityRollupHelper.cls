public class OpportunityRollupHelper{
    
    public static void rollupOpportunity(Map<id,opportunity> newMap, Map<id,opportunity> oldMap){
       Map<id,account> idAccountMap = new  Map<id,account> ();
        for(opportunity opp: newMap.values()){
            if(opp.accountid != null && newMap.get(opp.id).accountId != oldMap.get(opp.id).accountId){
                idAccountMap.put(opp.accountId, new account(id = opp.accountid, Oppurtunity_Count__c = null));
               idAccountMap.put(oldMap.get(opp.id).accountId, new account(id = oldMap.get(opp.id).accountId, Oppurtunity_Count__c = null));
            }
        }
        system.debug('newMap'+ newMap);
        for(AggregateResult result:[Select Count(id)totalcount, accountid from opportunity where accountid In: idAccountMap.keyset() Group By Accountid]){
            idAccountMap.get((id)result.get('accountId')).Oppurtunity_Count__c = (integer)result.get('totalcount');
        }
        if(idAccountMap.size()>0){
            update idAccountMap.values();
        }
    }

}