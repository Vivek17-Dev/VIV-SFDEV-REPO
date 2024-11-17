@isTest
public class TestRestrictContactByName 
{
 @isTest public static void TestRestrictContactName()
    { 
        contact con = new contact( lastName = 'INVALIDNAME');
        insert con;  
         Test.startTest();
      database.saveResult Result= Database.insert(con,false);
         Test.stopTest();
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size() > 0);
        System.assertEquals('The Last Name "'+con.LastName+'" is not allowed for DML',
                             result.getErrors()[0].getMessage());
        
    }

}