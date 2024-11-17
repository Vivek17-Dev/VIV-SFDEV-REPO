trigger AccountAddressTrigger on Account (before insert, before update)
{
    List <account> a = new list <account>([Select BillingPostalCode,BillingAddress,ShippingAddress,ShippingPostalCode from Account]);
 for( account a : trigger.new)
 {
   
     if(a.Match_Billing_Address__c == true && a.BillingPostalCode != null)
     {
      a.BillingPostalCode = a.ShippingPostalCode;
     }
 }
}