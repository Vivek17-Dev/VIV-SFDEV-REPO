public class ContactRollUpTriggerHandler {
    Public static void UpdateRollUpAccount(List<contact> ConList)
    {
       List<Id> AccIdList = new   List<Id>();
        Map<id,account> AccDateMap = new  Map<id,account>();
        for(contact c: ConList)
        {
          AccIdList.add(c.AccountId);
             
        }
        
        for(id accid :AccIdList )
        {
            AccDateMap.Put(accid, new Account(id = accid, MinimumDateContact__c = null ));
        }
       
        for(AggregateResult Ar : [select Min(Minimum_Date__c)mindate, accountid from contact where AccountId IN:AccIdList Group By Accountid])
        {
            
           AccDateMap.get((id)Ar.get('accountid')).MinimumDateContact__c = (Date)Ar.get('mindate');         
        }
        
        if(AccDateMap.size()>0){
            update AccDateMap.values();
        }
        
        
        list<case> caseList = new list<case>();
     List<id> ownerIdList = new List<id>();
Map<id,case> OwnCaseMap = new Map<id, Case>();
Map<id, list<case>> OwnCaseCount = new Map<id, list<case>>();
for(case c: caseList){
   if(OwnCaseCount.containsKey(c.OwnerId)){
        OwnCaseCount.put(c.OwnerId, new List<case>());
    }
    OwnCaseCount.get(c.OwnerId).add(c);
   ownerIdList.add(c.ownerId);
   OwnCaseMap.put(c.ownerId, c);

}
 for(AggregateResult Ar :[select Count(id)casecount, ownerid from case where createddate = This_MOnth AND ownerid In:ownerIdList Group By Ownerid]){

   if(OwnCaseMap.containsKey((id)Ar.get('ownerId')) && (integer)Ar.get('casecount') + OwnCaseCount.get((id)Ar.get('ownerId')).size() > 100){

       for(case c : OwnCaseCount.get((id)Ar.get('ownerId')))
       {
           c.adderror('user cnnot have more than 100 opportunity');
       }

}
}
        
        
    }
}