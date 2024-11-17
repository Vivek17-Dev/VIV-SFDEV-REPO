trigger orderTrigger on Order (
   
     after update
) {
    if(trigger.isAfter && trigger.isUpdate){
    OrderHelper.Afterupdate(trigger.new, trigger.oldMap);
    }
}