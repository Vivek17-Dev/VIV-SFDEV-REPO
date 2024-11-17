public class ParkLocator {
    Public static List<String> country (String count)
    {
        ParkService.ParksImplPort Park = new ParkService.ParksImplPort();
        //string count = 'India';
        
       return park.byCountry(count);
    }
}