public Class ChangeTimeZone { 
     public List<SelectOption> getTimeZone(){
      List<SelectOption> options = new List<SelectOption>();
      Schema.DescribeFieldResult fieldResult = User.TimeZoneSidKey.getDescribe();
      List<Schema.PicklistEntry> PkListEntry = fieldResult.getPicklistValues();
      for( Schema.PicklistEntry  pkEnt : PkListEntry) {
          options.add(new SelectOption(pkEnt.getLabel(), pkEnt.getValue()));
       }       
      return options;
        
          } 
    
}