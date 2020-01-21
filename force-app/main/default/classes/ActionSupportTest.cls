public class ActionSupportTest {
    public SelectOption[] getSchedules() {
        return new SelectOption[] { new SelectOption('Value1', 'Option1'), 
            new SelectOption('Value2', 'Option2'), new SelectOption('Value3', 'Option3') };
    }

    public String discountScheduleID { get; set; }
    
    public PageReference calcPricing(){
        
        system.debug('EXECUTED');
        return null;
    }
}