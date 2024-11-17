@isTest
public class MaintenanceDataFactory {
    
    Public static List<case> CreateMRdata(Integer CaseNum, Integer ProdNum, string type)
    {
        List <product2> prodList = new  List <product2>();
        List <Case> CaseList = new  List <Case>();
        List <Equipment_Maintenance_Item__c> EquipList = new  List <Equipment_Maintenance_Item__c>();
        if(ProdNum>0){
        for(Integer i=0; i<ProdNum; i++)
        {
            product2 eq = new product2();
            eq.Name = 'eq '+ i;
            eq.IsActive = true;
            eq.numberOfFlowers__c = 12;
            eq.percentOfOpening__c = 0;
            eq.Maintenance_Cycle__c = 10 + i;
            eq.Replacement_Part__c = true;
            prodList.add(eq);
        }
            
        Insert prodList;
        }
        
        Vehicle__c V = new Vehicle__c();
        V.name = 'Vehicle';
        Insert V;
        for(Integer i=0; i<CaseNum; i++)
        {
            case c = new case();
            c.Status = 'new';
            c.Type = type;
            c.Origin = 'web';
            c.Vehicle__c = v.id;
            c.Subject = 'TestSubject';
            
            CaseList.add(c);
            
        }
        
        Insert CaseList;
        
        
        for( case c: CaseList) {
            if(prodList.size()<0){
               break;
                    }
            for(Product2 prod: prodList)
            {
                Equipment_Maintenance_Item__c equip = new Equipment_Maintenance_Item__c();
                equip.Maintenance_Request__c = c.Id;
                equip.Equipment__c = prod.id;
                EquipList.add(equip);
            }
            
        }
        
        Insert EquipList;
        
        
        return CaseList;
        
        }
    }