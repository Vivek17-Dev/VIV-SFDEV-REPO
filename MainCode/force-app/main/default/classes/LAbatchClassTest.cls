@isTest
private class LAbatchClassTest {
    @testSetup 
    static void setup() {
        List<lead> leads = new List<lead>();
        for (lead l:leads) {
            leads.add(new lead(Firstname='lead ',LastName ='last',company = 'acc',account_number__c='12345432123',
                PAN_number__c = 'ASDER1234W',isconverted=true));
        }
        insert leads;
    }
    static testmethod void test() {        
        Test.startTest();
        LoanAccountBatchClass LABC = new LoanAccountBatchClass();
        Id batchId = Database.executeBatch(LABC);
        Test.stopTest();
        System.assertEquals(1, [select count() from loan_account__c where PAN_number__c='ASDER1234W']);
    }
    
}