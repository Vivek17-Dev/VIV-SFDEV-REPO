global class BatchclassTek implements database.Batchable<sobject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        string query = ' select id from user';
        return database.getQueryLocator(query);
    }
    global void execute (Database.BatchableContext bc, List<sobject> sList)
    {
        
    }
    
    global void finish(Database.BatchableContext bc)
    {
        
    }

}