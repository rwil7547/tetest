public with sharing class ListRacesApexController {
    
    @AuraEnabled
    public static List<Race__c> getRacesDB() {
        return [SELECT Name, Id, Type__c, Attended__c, DateTime__c, Results__c 
                FROM Race__c];
    }

}