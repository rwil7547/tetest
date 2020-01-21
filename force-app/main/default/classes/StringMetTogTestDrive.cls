@isTest

Public Class StringMetTogTestDrive{

Static testMethod void insertOpportunity(){

    Opportunity jolly 		= new Opportunity();
    jolly.Name 				= 'Philly Steak';
    jolly.StageName 		= 'Closed Won';
    jolly.CloseDate 		= Date.today();
    jolly.LeadSource 		= 'Phone Inquiry';
    insert jolly;
    
    List<Opportunity> myList = [SELECT Id FROM Opportunity WHERE dfhhs__c = '2,017'];
    system.AssertEquals(1,myList.size());
    }
}