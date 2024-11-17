@isTest (seeAllData=false)
private class Product2Tests {
    
    /**
* @name product2Extension_UnitTest
* @description UnitTest for product2Extension
**/
    Private static TestMethod void Product2Extension_UnitTest(){
        PageReference pageRef = Page.Product2New;
        Test.setCurrentPage(pageRef);
        Product2 prod = new Product2(name='Test',isActive=true);        
        ApexPages.StandardController stdcontroller = new ApexPages.StandardController(prod);    
        
        Product2Extension ext = new Product2Extension(stdcontroller);
        
        system.assertEquals(constants.DEFAULT_ROWS, ext.productsToInsert.size());
        ext.addRows();
        system.assertEquals(2*constants.DEFAULT_ROWS, ext.productsToInsert.size());
        
        for(integer i =0; i<5; i++)
        {
            Product2Extension.ProductWrapper wrapper = ext.productsToInsert[i];
            Product2 testProduct = new Product2();
            testProduct.Name = 'Test Product' + i;
            testProduct.IsActive = true;
            testProduct.Initial_Inventory__c = 20;
            testProduct.Family = Constants.PRODUCT_FAMILY[0].getValue();
            wrapper.productRecord = testProduct;
            
            PricebookEntry testEntry = new PricebookEntry();
            testEntry.IsActive = true;
            testEntry.UnitPrice = 10;
            wrapper.pricebookEntryRecord = testEntry;
        }
        Test.startTest();
        ext.save();
        Test.stopTest();
        ext.getFamilyOptions();
        ext.GetInventory();
        
        List<product2> prods = [select id, name from product2 where name LIKE:'Test Product%'];
        system.assertEquals(5, prods.size());
        
    }
    @isTest private static void Product2Trigger_UnitTest(){
        
        Test.startTest();
        Product2 p = new Product2();
        p.Name = 'TestProduct';
        p.Family = 'Side';
        p.IsActive = true;
        p.Quantity_Ordered__c = 50;
        p.Initial_Inventory__c = 100;
        insert p;
        
        CollaborationGroup c = new CollaborationGroup();
        c.Name = 'TEST' + Constants.INVENTORY_ANNOUNCEMENTS;
        c.Description = 'test';
        c.CollaborationType = 'Public';
        insert c;
        
        p.Quantity_Ordered__c=96;
        update p;
        Test.stopTest();
    }
    
}