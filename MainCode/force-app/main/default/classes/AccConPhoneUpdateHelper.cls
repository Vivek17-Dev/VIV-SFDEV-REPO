public class AccConPhoneUpdateHelper {
    
    public static void UpdateContactPhone( List<account> accList){
        Map<id,List<contact>> accConMap = new Map<id,List<contact>>();
        Map<id, string> accIdPhoneMap = new  Map<id, string>();
        List<Contact> conList = new List<Contact>();
        for(account acc: accList){
            accIdPhoneMap.put(acc.ID, acc.phone);
        }
        for(contact con: [Select id, name, phone from Contact where Accountid =: accIdPhoneMap.keySet()])
        {
          
            con.phone = accIdPhoneMap.get(con.Id);
            conList.add(con);
            /*if(!accConMap.ContainsKey(con.Accountid)){
                accConMap.put(con.AccountId, new List<contact>{con});
            }
            else{
                accConMap.get(con.AccountId).add(con);
            }*/
            
        }
           
        if(conList.size()>0){
            update conList;
        }        
    }

}