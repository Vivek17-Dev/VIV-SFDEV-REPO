public class stringarraytest {
  public static list<string> generatestringarray(integer N)
    {
        list<string> test = new list<string>();
        for(integer i=0;i<N;i++) 
        {
          string test1 = 'Test '+i; 
           test.add(test1);
        }
        
        system.debug('success'+ test);
        return test;
    }
}