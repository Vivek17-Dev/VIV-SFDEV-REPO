@isTest
global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {   
            // start - specify the response you want to send
            ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
            List<String> result = new List<String>();
            result.add('Anamudi Shola National Park');    
            result.add('Anshi National Park');    
            result.add('Bandipur National Park');    
            response_x.return_x = result;
            // end
            response.put('response_x', response_x); 
        }
}