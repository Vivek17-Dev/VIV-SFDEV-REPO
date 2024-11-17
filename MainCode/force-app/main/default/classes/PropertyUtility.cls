public class PropertyUtility {
    public static void newListedProperties()
    {
        List<Property__c> newPropList = new List <Property__c>	([select Name,Broker__r.Email__c,Days_On_Market__c from Property__C
                                                                  Where Days_On_Market__c <= 30]); 
        for(property__c p :newPropList)
        {
            string propEmail = p.Name +':'+ p.Broker__r.Email__c;
            system.debug(propEmail);
        }
    }
}