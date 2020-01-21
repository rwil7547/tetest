public class customReport {
    
    private Decimal netAmount = 0;
    List<Opportunity> opps = new List<Opportunity>();
    
    public customReport() {
        opps = [SELECT Id, Amount FROM Opportunity
                 LIMIT 100];
    }

    public Decimal getChange() {
        
        for (Opportunity o : opps){
            if (o.Amount != null){
                netAmount = netAmount + o.Amount;
            }   
        }
        
        return netAmount;
    }
    
}