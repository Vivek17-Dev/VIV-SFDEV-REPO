public class MaintenanceRequestHelper {
    public static void updateWorkOrders(Map<Id,Case> cOldMap, Map<Id,Case> cNewMap){
        List<Id> caseToProcessIdList = new List<Id>();
        Map<Id,List<Equipment_Maintenance_Item__c>> caseIdToWpMap = new Map<Id,List<Equipment_Maintenance_Item__c>>();
        Map<Integer,Case> insertCaseMap = new Map<Integer,Case>();
        Map<Integer,List<Equipment_Maintenance_Item__c>> insertWpMap = new Map<Integer,List<Equipment_Maintenance_Item__c>>();
        List<Equipment_Maintenance_Item__c> insertAllWpList = new List<Equipment_Maintenance_Item__c>();
        Integer commonKey = 0;
        for(Id csId : cNewMap.keySet()){
            if(cOldMap.get(csId).status != 'Closed' && cNewMap.get(csId).status == 'Closed' && (cNewMap.get(csId).type == 'Repair' || cNewMap.get(csId).type == 'Routine Maintenance'))
                caseToProcessIdList.add(csId);
        }
        if(caseToProcessIdList.size() == 0)
            return;
        for (Equipment_Maintenance_Item__c wp: [Select Id, Name, Equipment__c, Equipment__r.Maintenance_Cycle__c, Maintenance_Request__c, Quantity__c From Equipment_Maintenance_Item__c Where Maintenance_Request__c IN :caseToProcessIdList]) {
            if(!caseIdToWpMap.containsKey(wp.Maintenance_Request__c))
                caseIdToWpMap.put(wp.Maintenance_Request__c, new List<Equipment_Maintenance_Item__c>{wp});
            else{
                List<Equipment_Maintenance_Item__c> tempList = caseIdToWpMap.get(wp.Maintenance_Request__c);
                tempList.add(wp);
                caseIdToWpMap.put(wp.Maintenance_Request__c, tempList);
            }
        }
        for(Id csId : caseToProcessIdList){
            List<Equipment_Maintenance_Item__c> relatedWpList = caseIdToWpMap.get(csId);
            List<Equipment_Maintenance_Item__c> insertWpList = new List<Equipment_Maintenance_Item__c>();
            Integer minDays;
            if(relatedWpList==null || relatedWpList.size()==0){
                relatedWpList = new List<Equipment_Maintenance_Item__c>();
                minDays = 0;
            }            
            for(Equipment_Maintenance_Item__c wp : relatedWpList){
                if(minDays == null || minDays >= wp.Equipment__r.Maintenance_Cycle__c.intValue())
                    minDays = wp.Equipment__r.Maintenance_Cycle__c.intValue();
                insertWpList.add(new Equipment_Maintenance_Item__c(Equipment__c=wp.Equipment__c, Quantity__c=wp.Quantity__c));
            }
            Case oldCase = cNewMap.get(csId);
            Case cse = new Case();
            cse.Type ='Routine Maintenance';
            cse.Status ='New';
            cse.Origin =oldCase.Origin;
            cse.Vehicle__c = oldCase.Vehicle__c;
            // cse.Equipment__c = oldCase.Equipment__c;
            cse.Subject = String.isBlank(oldCase.Subject) ? 'subject' : oldCase.Subject;
            cse.Date_Reported__c = System.today();
            cse.Date_Due__c = System.Today().addDays(minDays);
            insertCaseMap.put(commonKey, cse);
            insertWpMap.put(commonKey, insertWpList);
            commonKey++;
        }
        insert insertCaseMap.values();
        for(Integer i : insertCaseMap.keySet()){
            for(Equipment_Maintenance_Item__c wp : insertWpMap.get(i)){
                wp.Maintenance_Request__c = insertCaseMap.get(i).Id;
                insertAllWpList.add(wp);
            }
        }
        insert insertAllWpList;
    }
    
    public static void associateRemoveContact(List<case> newCases, Map<id,case> oldMap){
        Map<string, case> subCaseMap = new  Map<string, case>();
        for(case cse: newCases){
            if(oldMap != null){
            if(cse.status != oldMap.get(cse.id).status && cse.Status == 'Escalated' && cse.Subject != null){
                subCaseMap.put(cse.subject,cse);
                associateContact(subCaseMap);
            }
            if(cse.status != oldMap.get(cse.id).status && oldMap.get(cse.id).status == 'Escalated'){
                
               cse.ContactId = null;
            }
            }
            else if(cse.Status == 'Escalated' && cse.Subject != null){
                subCaseMap.put(cse.subject,cse);
                associateContact(subCaseMap);
            }
        }
        
        
    }
    public static void associateContact( Map<string, case> subCaseMap ){
        List<contact> existingCon = new   List<contact>();
        List<contact> insertConList = new   List<contact>();
        existingCon = [Select id, name from contact where name IN:subCaseMap.keyset() ];
        system.debug('subCaseMap-->'+ subCaseMap);
        if(existingCon.size() > 0){
            for(contact con: existingCon){
                subCaseMap.get(con.name).contactId = con.id;
                // updateCaseList.add( subCaseMap.get(con.name));
            }
        }else{
            for(String subject: subCaseMap.keyset()){
                contact con = new contact(LastName = subject);
                insertConList.add(con);  
            }
        }
        if(insertConList.size() >0){
            system.debug('insertConList-->'+ insertConList);
            integer ind = 0;
            Database.SaveResult[] result = database.insert(insertConList, false);
            for(Database.SaveResult res: result){
                if(res.isSuccess()){
                    subCaseMap.get(insertConList[ind].LastName).contactId = res.getId();
                }
                ind++;
            }
            
        }    
    }  
    }