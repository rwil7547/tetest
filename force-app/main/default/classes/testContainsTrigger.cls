@isTest
Public Class testContainsTrigger{

    public static testMethod void addSecretWords(){
    
    Contact Ronan = new Contact();
    Ronan.FirstName = 'Ronan';
    Ronan.LastName  = 'Williams';
    Ronan.Notes__c  = 'SSN';
    insert Ronan;
    
    System.debug('Ronans id is ' + Ronan.id);
    
    List<Case> secretWordCases = [SELECT id, Contactid FROM Case WHERE Contactid = :Ronan.id];
    
    System.AssertEquals(secretWordCases.size(),1);
    }
}