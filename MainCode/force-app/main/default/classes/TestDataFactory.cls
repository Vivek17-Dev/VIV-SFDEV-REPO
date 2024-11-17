/**
 * @name TestDataFactory
 * @description Contains methods to construct and/or validate commonly used records
**/
public with sharing class TestDataFactory {

   public static void VerifyQuantityOrdered(Product2 originalProduct, Product2 updatedProduct, Integer qtyOrdered)
   {
      
       system.assertEquals(updatedProduct.Quantity_Ordered__c, originalProduct.Quantity_Ordered__c + qtyOrdered);
       
   }
    
    /**
     * @name ConstructCollaborationGroup
     * @description
    **/
    public static CollaborationGroup ConstructCollaborationGroup(){
        //ToDo: Ensure this method returns a single Chatter CollaborationGroup
        //    whose Name starts with 'TEST' followed by the INVENTORY_ANNOUNCEMENTS constant
        //    and configured so anyone can join, see and post updates.
         CollaborationGroup g = new CollaborationGroup(Name='TEST'+constants.INVENTORY_ANNOUNCEMENTS, CollaborationType='Public', IsArchived = false,
              IsAutoArchiveDisabled = true);
   // g.OwnerId = UserInfo.getUserId();
    
        
        return g;
    }

    /**
     * @name CreateProducts
     * @description Constructs a list of Product2 records for unit tests
    **/
    public static List<product2> ConstructProducts(Integer cnt){
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Product2 records
        //  with all the required fields populated
        //  and IsActive = true
        //  an Initial Inventory set to 10
        //  and iterating through the product family picklist values throughout the list.
        //  
        List<product2> products =new  List<product2>();
      
           list<Schema.PicklistEntry> pEntries = Constants.PRODUCT_FAMILY;
        integer val = 0;
         for(integer i = 0; i< cnt; i++){
            //account acc = new account();
             if(val == 4){
                 val =0;
             }
            
            products.add(new product2(name= 'prod'+i, isActive = true, Initial_Inventory__c = 10, Family = pEntries.get(val).getvalue()));
       val++;
         }
           
        
     
        return products;
    }

    /**
     * @name CreatePricebookEntries
     * @description Constructs a list of PricebookEntry records for unit tests
    **/
    public static  List<pricebookentry> ConstructPricebookEntries(List<Product2> prods){
        //ToDo: Ensure this method returns a corresponding list of PricebookEntries records
        //  related to the provided Products
        //  with all the required fields populated
        //  and IsActive = true
        //  and belonging to the standard Pricebook
        List<pricebookentry> entries = new  List<pricebookentry>();
        for(product2 pr: prods){
            integer i = 0;
           entries.add(new pricebookentry(pricebook2Id = constants.STANDARD_PRICEBOOK_ID, UnitPrice = 100, product2ID = pr.id));
          i++;
               }
         
        return entries;
    }

    /**
     * @name CreateAccounts
     * @description Constructs a list of Account records for unit tests
    **/
    public static List<Account> ConstructAccounts(Integer cnt){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Account records
        //  with all of the required fields populated.
     List<account> accList = new List<account>();
        for(integer i = 0; i< cnt; i++){
            //account acc = new account();
            accList.add(new account(name= 'acc'+i));
        }
       
        
      return acclist;        
    }

    /**
     * @name CreateContacts
     * @description Constructs a list of Contacxt records for unit tests
    **/
    public static List<contact>  ConstructContacts(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list, of size cnt, of uniquely named Contact records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<contact> conList = new List<contact>();
        for(integer i =0; i< cnt; i++){
            conlist.add(new contact(firstname = 'con', lastname = 'last'+i, accountid = accts[i].id));
        }
       
        return conList;
    }

    /**
     * @name CreateOrders
     * @description Constructs a list of Order records for unit tests
    **/
    public static List<order>  ConstructOrders(Integer cnt, List<Account> accts){
        //ToDo: Ensure this method returns a list of size cnt of uniquely named Order records
        //  related to the provided Accounts
        //  with all of the required fields populated.
        List<order> ordrList = new List<order>();
        for(integer i =0; i< cnt; i++){
            ordrList.add(new order(status = 'Draft', EffectiveDate= system.today(), accountid = accts[i].id, pricebook2Id =  constants.STANDARD_PRICEBOOK_ID ));
        }
        system.debug('oredr '+ ordrList);
       
        return ordrList;
    }

    /**
     * @name CreateOrderItems
     * @description Constructs a list of OrderItem records for unit tests
    **/
    public static List<orderItem> ConstructOrderItems(integer cnt, list<pricebookentry> pbes, list<order> ords){
        //ToDo: Ensure this method returns a list of size cnt of OrderItem records
        //  related to the provided Pricebook Entries
        //  and related to the provided Orders
        //  with all of the required fields populated.
        //  Hint: Use the DEFAULT_ROWS constant for Quantity as it will be used in the next challenge
   List<orderItem> ordrItemList = new List<orderItem>();
        for(integer i =0; i< cnt; i++){
            ordrItemList.add(new orderItem(orderId = ords[i].id, PricebookEntryId=pbes[i].id, Quantity = constants.DEFAULT_ROWS, UnitPrice = i));
        }
        
       
        return ordrItemList;
    
    
    }

    /**
     * @name SetupTestData
     * @description Inserts accounts, contacts, Products, PricebookEntries, Orders, and OrderItems.
    **/
    public static void InsertTestData(Integer cnt){
        //ToDo: Ensure this method calls each of the construct methods
        //  and inserts the results for use as test data.
         CollaborationGroup grp = ConstructCollaborationGroup();
        insert grp;
        List<account> accts = ConstructAccounts(cnt);
         insert accts;
       List<contact> cons = ConstructContacts(cnt, accts);
        insert cons;
       List<order> ordrs =  ConstructOrders(cnt, accts);
        insert ordrs;
        List<product2> prods = ConstructProducts(cnt);
        insert prods;
        List<priceBookEntry> entries = ConstructPricebookEntries(prods);
        insert entries;
       List<orderItem> items = ConstructOrderItems(cnt,entries,ordrs);
        insert items;
    }

}