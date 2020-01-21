public class OpportunityListController {


    
    private String sortOrder = 'CloseDate';
    
    public List<Opportunity> getOpportunities() {
        
        List<Opportunity> results = Database.query('SELECT Id, Name, Amount, CloseDate, Type ' +
                					'FROM Opportunity WHERE Amount != null ORDER BY ' + sortOrder + ' DESC ' +
                        			'LIMIT 10');
        
        return results;
    }
    
    public void sortByAmount() {
        this.sortOrder = 'Amount';
    }
    
    public void sortByType() {
        this.sortOrder = 'Type';
    }
    
}