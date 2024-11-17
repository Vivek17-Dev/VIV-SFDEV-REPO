@isTest
public class TestVerifyDate {
    @isTest public static void TestCheckdates()
    {
        //Date date1 = Date.newInstance(date1.year(), date1.month(), totalDays);
        date date1 = date.newInstance(1989, 12, 17);
        date date2 = date.newInstance(1989, 12, 23);
        Date D = VerifyDate.CheckDates(date1, date2);
          system.assertEquals(date2,D);
    }
    @isTest public static void TestCheckDates1()
    {
       date date1 = date.newInstance(1989, 12, 17); 
       date date2 = date.newInstance(1989, 01, 20); 
       date date3 = date.newInstance(1989, 12, 31); 
         Date D = VerifyDate.CheckDates(date1, date2);
          system.assertEquals(date3,D);
    }
    @isTest public static void TestDateWithin30Days()
    {  
      date date1 = date.newInstance(1989, 12, 17); 
       date date2 = date.newInstance(1989, 11, 20);
        date date3 = date.newInstance(1989, 12, 31); 
         Date D = VerifyDate.CheckDates(date1, date2);
          system.assertEquals(date3,D);
    }
        
    }