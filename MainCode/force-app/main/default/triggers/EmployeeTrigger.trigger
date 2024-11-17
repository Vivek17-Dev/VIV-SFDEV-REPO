trigger EmployeeTrigger on Employee__c (before insert, before update) {
    if( trigger.IsInsert){
        EmployeeTriggerHandler.EmployeeTriggerHandlerInsert(trigger.new);
    }
    if(trigger.IsUpdate){
EmployeeTriggerHandler.EmployeeTriggerHandlerUpdate(trigger.new, trigger.oldmap);
    }
}