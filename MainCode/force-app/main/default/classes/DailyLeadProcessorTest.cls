@isTest  
 private class DailyLeadProcessorTest{  
   @testSetup  
   static void setup(){  
     List<Lead> listOfLead = new List<Lead>();  
     for(Integer i = 1; i <= 200; i++){  
       Lead ld = new Lead(Company = 'Comp' + i ,LastName = 'LN'+i, Status = 'Working - Contacted');  
       listOfLead.add(ld);  
     }  
     Insert listOfLead;  
   }  
   static testmethod void testDailyLeadProcessorScheduledJob(){  
     String sch = '0 5 12 * * ?';  
     Test.startTest();  
     String jobId = System.schedule('ScheduledApexTest', sch, new DailyLeadProcessor());  
     List<Lead> listOfLead = [SELECT Id FROM Lead WHERE LeadSource = null LIMIT 200];  
     System.assertEquals(200, listOfLead.size());  
     Test.stopTest();  
   }  
 }