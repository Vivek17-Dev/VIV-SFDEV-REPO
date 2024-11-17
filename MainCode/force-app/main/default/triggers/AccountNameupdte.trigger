trigger AccountNameupdte on Account (after insert, after update) {
    
    
    Set<id> Accid = new Set<id>();
    Map<id, string>  AccNameMAp = new Map<id, string>();
    List<contact> conList = new List<contact>();
    if(trigger.isafter && trigger.isUpdate){
        
    for(account a: trigger.new)
    {
        if(a.name != trigger.oldmap.get(a.id).name){
        AccNameMAp.put(a.id, a.Name);
        Accid.add(a.id);
        }
    }
    for(contact c:[select id, name, accountid from contact where accountid In: Accid])
    {
        c.firstname = AccNameMAp.get(c.accountid);
        conList.add(c);
    }
    
    if(conList.size()>0){
        update conList;
    }
}

}