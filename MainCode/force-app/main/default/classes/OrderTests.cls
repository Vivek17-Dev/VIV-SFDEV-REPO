@isTest 
private class OrderTests {
    @testSetup
    public static void SetupTestData(){
        TestDataFactory.InsertTestData(5);
    }
    
    static testmethod void OrderUpdate_UnitTest()
    {
        Test.startTest();
        
        order ord = [select id, status from order limit 1];
        system.debug('ord '+ ord);
        Product2 prod = [select name, quantity_ordered__c from product2 Limit 1];
        
        ord.status = constants.ACTIVATED_ORDER_STATUS;
        
        update ord;
        
        product2 updatedProd = [select name, quantity_ordered__c from product2 Limit 1];
        
        TestDataFactory.VerifyQuantityOrdered(prod, updatedProd, constants.DEFAULT_ROWS);
        
        Test.stopTest();
    }
    @isTest private static void OrderExtension_UnitTest(){
        PageReference pageRef = Page.OrderEdit;
        Test.setCurrentPage(pageRef);
        Order o = [SELECT Id, Status FROM Order LIMIT 1];
        ApexPages.StandardController stdcontroller = new ApexPages.StandardController(o);
        OrderExtension ext = new OrderExtension(stdcontroller);
       ext.PopulateOrderItems();
        ext.OnFieldChange();
        ext.SelectFamily();
        ext.Save();
        ext.First();
        ext.Next();
        ext.Previous();
        ext.Last();
        ext.GetHasPrevious();
        ext.GetHasNext();
        ext.GetTotalPages();
        ext.GetPageNumber();
      //  System.assertEquals(1, ext.orderItemList.size());
        List<SelectOption> options = ext.GetFamilyOptions();
    }
    
}