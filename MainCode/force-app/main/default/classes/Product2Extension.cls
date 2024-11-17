public class Product2Extension {

    public List<ProductWrapper> productsToInsert {get;set;}
    Public List<selectOption> FamilyOptions{get; set;}
    List<ChartHelper.ChartData> Inventory{get; set;}
    public Product2Extension(ApexPages.StandardController product2){
        productsToInsert = new List<ProductWrapper>();
       FamilyOptions = getFamilyOptions();
        Inventory =GetInventory();
        addRows();
    }
   // constants con = new constants();
    public void AddRows(){
        for ( Integer i=0; i<constants.DEFAULT_ROWS; i++ ){
            productsToInsert.add( new ProductWrapper() );
        }
    }
  //get family options
  
    public List<selectoption> getFamilyOptions(){
        
        List<SelectOption> options = new List<SelectOption>();
        options.add(new selectOption(constants.SELECT_ONE, constants.SELECT_ONE));
        
        for(schema.PicklistEntry ple: constants.PRODUCT_FAMILY){
            options.add(new selectOption( ple.getValue(), ple.getLabel()));
        }
        
        return options;
    }
    public List<ChartHelper.ChartData> GetInventory(){
        return ChartHelper.GetInventory();
    }

    public PageReference Save(){
       SavePoint sp = Database.setSavepoint();
        try {
           
            List<product2> products = new List<product2>();
            List<PricebookEntry> Entries = new List<PricebookEntry>();
            for(ProductWrapper wrp: productsToInsert)
            {
                if(wrp.productRecord != null && wrp.pricebookEntryRecord != null) {
                    if(wrp.productRecord.name != null && wrp.productRecord.Family != null && wrp.productRecord.isActive != null
                       && wrp.productRecord.Initial_Inventory__c != null && wrp.pricebookEntryRecord.unitprice != null ){
                         products.add(wrp.productRecord);
                         pricebookEntry entry = new pricebookEntry();
                           entry.isActive = true;
                           entry.Pricebook2ID = constants.STANDARD_PRICEBOOK_ID;
                           entry.Unitprice = wrp.pricebookEntryRecord.unitprice;
                           entries.add(entry);
                       }
                    
                    
                   
                }
               
            }
            system.debug('products '+ products);
            insert products;
                
                 for(integer i=0; i <entries.size(); i++ ){
                       entries[i].Product2ID = Products[i].id;
                    }
                    
                    insert entries;
           // insert productsToInsert;

            //If successful clear the list and display an informational message
            apexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO,productsToInsert.size()+' Inserted'));
            productsToInsert.clear();   //Do not remove
            addRows();  //Do not remove
        } catch (Exception e){
                Database.rollback(sp);
            apexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR,constants.ERROR_MESSAGE));
        }
        return null;
    }

    public class ProductWrapper{
        public Product2 productRecord{get;set;}
       public PriceBookEntry pricebookEntryRecord{get;set;}
        
        public ProductWrapper(){
            productRecord = new Product2(Initial_Inventory__c = 0);
            pricebookEntryRecord = new PriceBookEntry(unitprice = 0.0);
        }
    }
}