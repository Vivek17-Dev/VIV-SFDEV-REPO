trigger ClosedOpportunityTrigger on Opportunity (after insert, after update)
{
  /* List <Task> Tasklist = New List <Task>();
   List <Opportunity> Opp = New List <Opportunity>();
    for(Opportunity Opp :[ Select id, Name,stageName from Opportunity Where Id IN : Trigger.new And StageName ='Closed Won']){
      
         Task NewTask = new Task( Whatid = opp.Id, Subject = 'Follow Up Test Task');
            tasklist.add(newTask);
    }
            Insert tasklist;   */
    
    if(Trigger.isAfter){
        if(Trigger.isInsert || Trigger.isUpdate){
            OpportunityRollupHelper.rollupOpportunity(Trigger.newMap, Trigger.oldMap);
        }
    }
}