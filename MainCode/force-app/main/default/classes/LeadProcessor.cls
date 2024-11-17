Global class LeadProcessor implements Database.Batchable<sObject>
{
    Global database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('Select id,name,Leadsource from Lead');
    }
    global void execute(database.BatchableContext bc,list<lead> L){
       list <lead> leads = new list<lead>();
        for(lead ld : L)
        {
            ld.Leadsource = 'Dreamforce';
            leads.add(ld);
        }
        update leads;
    }
    global void finish(database.BatchableContext bc)
    {
        
    }
}