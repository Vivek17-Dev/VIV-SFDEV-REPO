public class CampingListController {
 @AuraEnabled   
    Public Static List<Camping_Item__c> getItems(){
        
       return [Select Name, price__c, Quantity__c, Packed__c from Camping_Item__c ];
       // System.debug('CampingList '+ CampingList);
         //CampingList;
    }
    
    @AuraEnabled
    Public Static Camping_Item__c SaveItem(Camping_Item__c CampList)
    {
    
            insert CampList;
            Return CampList;
           
       
         
    }

}