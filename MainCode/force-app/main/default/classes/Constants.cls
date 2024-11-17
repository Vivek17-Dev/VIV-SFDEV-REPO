public class Constants {
    Public Static Final Integer DEFAULT_ROWS = 5;
   Public Static Final String SELECT_ONE = system.Label.SELECT_ONE;
  Public Static Final  String INVENTORY_LEVEL_LOW = system.Label.INVENTORY_LEVEL_LOW;
    Public Static Final Schema.DescribeFieldResult fieldResult = Product2.family.getDescribe();
     Public Static Final List<Schema.PicklistEntry> PRODUCT_FAMILY = fieldResult.getPicklistValues();
  Public Static Final String DRAFT_ORDER_STATUS = 'Draft';
  Public Static Final String ACTIVATED_ORDER_STATUS = 'Activated';
   Public Static Final String INVENTORY_ANNOUNCEMENTS = 'Inventory Announcements';
  Public Static Final String ERROR_MESSAGE = 'An error has occurred, please take a screenshot with the URL and send it to IT.';
   Public Static Final String STANDARD_PRICEBOOK_ID = '01s2w000002P3eRAAS';
}