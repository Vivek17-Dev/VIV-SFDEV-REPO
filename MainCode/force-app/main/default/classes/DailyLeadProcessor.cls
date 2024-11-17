global class DailyLeadProcessor implements Schedulable {
    global void execute(Schedulablecontext context) 
    {
        List<lead> Leadlist = new list <lead>();
        for(integer i = 0;i<200;i++)
        {
        Lead L = new Lead(firstName = 'lead'+i,leadsource = '',Company = 'Company'+i,LastName = 'leadlastname'+i, 
                         Status = 'Open - Not Contacted');
        leadList.add(L);
        }
            insert LeadList;
    
        list <lead> leadlist1 = [ select id, Firstname, leadsource from lead where leadsource = '' Limit 200];
        system.debug('leadlist ' + leadlist1);
        if(leadlist1.size()>0)
        {
     for( lead L : leadlist1) 
     {
      // L.FirstName = 'lead1';
        L.leadsource = 'DreamForce';
      }
            update leadlist1;
        }
    }
}