/**
* @name product2Trigger
* @description Trigger to notify staff of low levels of inventory
**/
trigger product2Trigger on Product2 (
    before insert,
    before update,
    before delete,
    after insert,
    after update,
    after delete,
    after undelete
) {
    try {
        if(trigger.isAfter && trigger.isUpdate){
            List<Product2> newList = new List<Product2>();
              List<Product2> oldList = new List<Product2>();
        for ( Product2 p : Trigger.New ){
            if (
                p.Id != null && (
                    ( p.Family == 'Entree' && p.Quantity_Remaining__c < 20 )||
                    ( p.Family == 'Side' && p.Quantity_Remaining__c < 10 )||
                    ( p.Family == 'Dessert' && p.Quantity_Remaining__c < 15 )||
                    ( p.Family == 'Beverage' && p.Quantity_Remaining__c < 5 )
                )
            ){
                newList.add(p);
                oldList.add(trigger.oldMap.get(p.id));
               
            }
        }
             Product2Helper.afterUpdate(newList, oldList);
        }
    } catch ( Exception e ){
          System.debug('The following exception has occurred: ' + e.getMessage());

    }
}