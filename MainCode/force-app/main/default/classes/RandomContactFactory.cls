public class RandomContactFactory
{
    public static List<contact>  generateRandomContacts(integer numcon, string LName)
    {
      List <contact> con = new List <contact>();
        for( Integer i=0; i<numcon; i++) {
           Contact c = new Contact(firstName = 'Contact' +i, LastName = LName);
            con.add(c);
        }
          return con;    
    }

}