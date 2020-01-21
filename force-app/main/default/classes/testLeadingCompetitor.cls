@isTest
public class testLeadingCompetitor{

public static testMethod void testLeadingCompetitor(){

    Opportunity o     = new Opportunity();
    o.Name            = 'My Test';
    o.CloseDate       = Date.today();
    o.StageName       = 'Prospecting';
    o.Competitor_1__c       = 'Yahoo!';
    o.Competitor_2__c       = 'Amazon';
    o.Competitor_3__c       = 'Google';
    o.Competitor_1_Price__c = 100;
    o.Competitor_2_Price__c = 500;
    o.Competitor_3_Price__c = 5500; 
    
    insert o;

    system.AssertEquals(o.Competitor_1__c,'Yahoo!');    
    system.AssertEquals(o.Leading_Competitor__c,'Yahoo!');
    system.AssertEquals(o.Highest_Competitor__c,'Google');
    }

}