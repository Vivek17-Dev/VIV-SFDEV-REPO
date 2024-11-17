@isTest
public class ParkLocatorTest {
     @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
       String country = 'India';
        List<string> result = ParkLocator.country(country);
        // Verify that a fake result is returned
        List<String> response = new List<String>();
            result.add('Anamudi Shola National Park');    
            result.add('Anshi National Park');    
            result.add('Bandipur National Park'); 
        System.assertEquals(response, result); 
    }

}