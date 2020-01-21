public class OpportunityWrapper {

    public List<oOpportunity> opportunityList {get; set;}
    
    public List<oOpportunity> getOpportunities() {
        if (opportunityList == null) {
            opportunityList = new List<oOpportunity>();
            for (Opportunity o : [SELECT Id, Name, StageName, CloseDate FROM Opportunity LIMIT 10]) {
                opportunityList.add(new oOpportunity(o));
            }
        }
        
        return opportunityList;
    }
    
    public PageReference processSelected() {
        
        List<Opportunity> selectedOpportunities = new List<Opportunity>();
        
        for (oOpportunity oOpp : getOpportunities()) {
            if (oOpp.selected == true ) {
                selectedOpportunities.add(oOpp.opp);
            }
        }
        
        for (Opportunity opp : selectedOpportunities) {
            System.debug('I close on ' + opp.CloseDate + ' and I\'ve been selected');
        }
                         
        opportunityList = null;
                         
        return null;
        
    }

    
    public class oOpportunity {
        public Opportunity opp {get; set;}
        public Boolean selected {get; set;}
        
        public oOpportunity (Opportunity o) {
            opp = o;
            selected = false;
        }
    }
 
}