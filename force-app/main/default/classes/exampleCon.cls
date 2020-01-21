public class exampleCon {
    Integer count = 0;
                        
    public PageReference incrementCounter() {
        if (count == 0 ){
            count++;
            return null;
        } else {
            count = count * 2;
            return null;
        }
    }
                    
    public Integer getCount() {
        return count;
    }
}