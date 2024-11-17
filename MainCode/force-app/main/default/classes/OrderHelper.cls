public class OrderHelper {

    
    public static void AfterUpdate(List<Order> newList, Map<id, order> oldMap){
        Set<Id> orderIds = new Set<Id>();
        string status = constants.ACTIVATED_ORDER_STATUS;
        for(order ord : newList){
            if(ord.status != OldMap.get(ord.id).status && ord.status == status){
               orderIds.add(ord.id); 
            }
        }
        RollUpOrderItems(orderids);
    }

    /**
     * @name RollUpOrderItems
     * @description Given a set of Activated Order ids, query the child Order Items and related Products to calculate Inventory levels
     * @param Set<Id> activatedOrderIds
     * @return void
    **/
    public static void RollUpOrderItems(Set<Id> activatedOrderIds){
        Map<id, Product2> productMap = new Map<id, Product2>();
        List<product2> ProdList = new List<product2>();
        for(orderItem Oi : [SELECT Id, OrderId, Product2Id, Product2.Quantity_Ordered__c, Quantity
                    FROM OrderItem
            WHERE OrderId IN :activatedOrderIds]){
               productMap.put(oi.Product2Id, oi.product2); 
            }
        List<aggregateResult> result = [Select SUM(Quantity)Qt, product2id from orderItem where product2id In: productMap.keyset() Group By product2id];
                                
        for(AggregateResult res : result){
        
            
          productMap.get((Id)res.get('product2id')).Quantity_Ordered__c = (double)res.get('Qt');
        prodList.add( productMap.get((Id)res.get('product2id')));
        }
        
        if(ProdList.size()>0){
            update ProdList;
        }
        //ToDo: Declare a Map named "productMap" of Ids to Product2 records

        //ToDo: Loop through a query of OrderItems related to the activatedOrderIds

            //ToDo: Populate the map with the Id of the related Product2 as the key and Product2 record as the value

        //ToDo: Loop through a query that aggregates the OrderItems related to the Products in the ProductMap keyset

        //ToDo: Perform an update on the records in the productMap
    }

}