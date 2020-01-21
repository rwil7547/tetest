public class aaPage52 {
    public Integer X { get; set; }
    public Integer X2 { get; set; }
    
    public aaPage52() {
        X = 0;
        X2 = 0;
    }
    public PageReference TestX() {
        String strX = ApexPages.currentPage().getParameters().get('X');
        if (strX != null) {
            this.X = Integer.ValueOf(strX);
        }
        return null;
    }
    public PageReference TestX2() {
        return null;
    }
    
    public SelectOption[] getYears() {
        return new SelectOption[] { new SelectOption('Value1', 'This month'), 
        	new SelectOption('Value2', 'Current FY'), 
            new SelectOption('Value3', 'Next FY'), 
            new SelectOption('Value4', 'Previous FY') };
    }    
}