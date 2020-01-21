global class OppRemoter4 {

    @RemoteAction
    global static List<Opportunity> getOpps(String startString, String endString){
    
        Date startDate = Date.valueOf(startString);
        Date endDate = Date.valueOf(endString);
            
        return [SELECT Name, Id, CloseDate, Event_End__c FROM Opportunity 
               WHERE CloseDate > :startDate
               AND Event_End__c < :endDate
               LIMIT 100];
        
       
    }
    
}