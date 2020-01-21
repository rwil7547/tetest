global class OppRemoter {

    @RemoteAction
    global static List<Opportunity> getOpps(){
            
        return [SELECT Name, Id, CloseDate, Event_End__c FROM Opportunity 
               ORDER BY Length__c DESC LIMIT 10];
        
       
    }
    
}