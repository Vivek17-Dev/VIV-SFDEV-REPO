public class contactAndLeadSearch {
    public static list<list<sobject>> searchContactsAndLeads(string str)
    {
        string s = str;
        list<list<sobject>> searchlist =[find:str in all fields returning contact(firstname,lastname),lead(firstname,lastname)];
        return searchlist;
    }

}