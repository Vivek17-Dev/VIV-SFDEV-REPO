public without sharing class ChartHelper {

    @AuraEnabled
    public static List<chartData> GetInventory(){
        List<chartData> cht = new List<chartData>();
        //ToDo: Perform a calculation that aggregates active Products that have a positive Quantity_Remaining__c
        //  And return a list of chartData
        Map<string, decimal> famQtMap = new  Map<string, decimal>();
       // List<AggregateResult> result = [Select family, Sum(Quantity_Remaining__c)qt from Product2 Group by family];
        for(AggregateResult ar: [Select family, Sum(Quantity_Remaining__c)qt from Product2
                                where Quantity_Remaining__c > 0 AND isActive = true  Group by family]){         
          cht.add(new chartdata((String)ar.get('family'),(decimal)ar.get('qt')));            
                  
                  }
        
                  
        //  Where the name is the Product Family and the Qty is the sum of the Quantity_Remaining__c
        return cht;
    }

    public class ChartData {
        public String name {get;set;}
        public Decimal val {get;set;}

        public ChartData(String name, Decimal val){
            this.name = name;
            this.val = val;
        }
    }

}