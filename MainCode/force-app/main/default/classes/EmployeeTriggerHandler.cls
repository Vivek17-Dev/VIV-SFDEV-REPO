public class EmployeeTriggerHandler {
    
    Public static void EmployeeTriggerHandlerInsert (List<employee__c> EmpList)
    {
       
        Map<string, string> NameCon = new Map<string, string>();
        Map<string, Employee__c> NameEmp = new Map<string, Employee__c>();
        ID PunqueueId = [SELECT Queue.Id FROM queuesobject WHERE queue.name='Punjab'].Queue.Id;
        ID BenqueueId = [SELECT Queue.Id FROM queuesobject WHERE queue.name='Bengal'].Queue.Id;
               
        for(employee__c emp :EmpList  ) {

            if(emp.name.contains('Singh')){
                system.debug('singh' + PunqueueId);
                emp.OwnerId = PunqueueId;
            }
            if(emp.name.contains('Das')){
                emp.OwnerId = BenqueueId;
            }
                NameCon.put(emp.name, emp.Contact__c);
               NameEmp.put(emp.name, emp);
           
        }  
            for(employee__c emp : [select id, name, contact__c from employee__c where Name IN: NameCon.keyset()])
            {
                if(emp != null && emp.Contact__c == NameCon.get(emp.name)){
                
                
               NameEmp.get(emp.name).addError('record should be unique');
            
            }
                
    }
        
       
    
}
    Public static void EmployeeTriggerHandlerUpdate (List<employee__c> EmpList, Map<id, employee__c> OldMap)
    {
       
        Map<string, string> NameCon = new Map<string, string>();
        Map<string, Employee__c> NameEmp = new Map<string, Employee__c>();
        
        ID PunqueueId = [SELECT Queue.Id FROM queuesobject WHERE queue.name='Punjab'].Queue.Id;
        ID BenqueueId = [SELECT Queue.Id FROM queuesobject WHERE queue.name='Bengal'].Queue.Id;
      

        for(employee__c emp :EmpList  ) {
            if(emp.name != oldMap.get(emp.id).name || emp.contact__c != oldMap.get(emp.id).contact__c){
               
                if(emp.name.contains('Singh')){
                    system.debug('singh' + PunqueueId);
                emp.OwnerId = PunqueueId;
            }
            if(emp.name.contains('Das')){
                emp.OwnerId = BenqueueId;
            }
                NameCon.put(emp.name, emp.Contact__c);
               NameEmp.put(emp.name, emp);
            }
        }  
            for(employee__c emp : [select id, name, contact__c from employee__c where Name IN: NameCon.keyset()])
            {
                if(emp != null && emp.Contact__c == NameCon.get(emp.name)){
                
                
               NameEmp.get(emp.name).addError('record should be unique');
            
            }
    }
        
}
}