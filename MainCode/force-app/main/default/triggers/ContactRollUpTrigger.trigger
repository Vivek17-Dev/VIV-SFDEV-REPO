trigger ContactRollUpTrigger on Contact (After Insert, After update) {
    
    If(Trigger.IsAfter)
    {
        if(Trigger.IsInsert){
           
            ContactRollUpTriggerHandler.UpdateRollUpAccount(Trigger.new);
        }
        If(Trigger.isUpdate) 
        {
            for(contact con :[select id, name,Minimum_Date__c from contact where Id In:Trigger.new])
            {
                if(con.Minimum_Date__c != Trigger.oldMap.get(con.id).Minimum_Date__c)
                {
                    ContactRollUpTriggerHandler.UpdateRollUpAccount(Trigger.new);
                }
            }
        } 
    }

}