public class giveText {
    
    public Id opportunityId {get;set;}
    
    public string getCount() {
        
        Opportunity opp = [SELECT Id, Event_start__c, Event_end__c FROM Opportunity
                          WHERE Id = :opportunityId LIMIT 1];
        
        Date startDate = opp.Event_start__c;
        Date endDate = opp.Event_end__c;

        List<Opportunity> relevantOpps = [SELECT Name FROM Opportunity
                                         WHERE
                                          (Event_start__c >=: startDate AND
                                           Event_start__c <=: endDate)
                                         OR
                                          (Event_end__c >=: startDate AND
                                           Event_end__c <=: endDate)];
        
        String response;
        
        if (relevantOpps.size() > 0) {
            response = 'There are currently ' + relevantOpps.size() + 'taking place at this time.';
        } else {
            response = 'There are currently no other events taking place on this day.';
        }
        
        return response;
        
    } 
	
    public List<Opportunity> getDetails() {

        Opportunity opp = [SELECT Id, Event_start__c, Event_end__c FROM Opportunity
                          WHERE Id = :opportunityId LIMIT 1];
        
        Date startDate = opp.Event_start__c;
        Date endDate = opp.Event_end__c;

        List<Opportunity> relevantOpps = [SELECT Name, Account.Name FROM Opportunity
                                         WHERE
                                          (Event_start__c >=: startDate AND
                                           Event_start__c <=: endDate)
                                         OR
                                          (Event_end__c >=: startDate AND
                                           Event_end__c <=: endDate)];        
        
        return relevantOpps;
        
    }
    
    public string getgiveText () {
        string texty = 'text';
        return texty;
    }

}