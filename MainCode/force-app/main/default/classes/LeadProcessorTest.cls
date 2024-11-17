@isTest
public class LeadProcessorTest
{
@TestSetup
    static void setup()
    {  
      list <lead> leads =  new List<lead>();
      for(Integer i=0;i<200;i++)
        {
            leads.add(new lead(LastName ='Leads'+i,Company = 'Accenture',leadsource='',account_number__c = '12345678901',Loan_amount__c=5000000));
        }
    insert leads;
    }
    static testmethod void test() {        
        Test.startTest();
        LeadProcessor LP = new LeadProcessor();
        Id batchId = Database.executeBatch(LP);
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where Leadsource = 'DreamForce']);
    }

}