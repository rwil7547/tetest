@isTest
public class usingMyOClaTestDrive{

    public static  testMethod void testDrive(){
    
    Opportunity oppy =  new Opportunity();
    oppy.CloseDate = Date.today();
    oppy.Name = 'oppy Opp';
    oppy.StageName = 'Forecasting';
    insert oppy;
    
    List<Contact> licon = [SELECT Id FROM Contact WHERE FirstName = 'Amethod'];
    System.assertequals(1,licon.size());
    }
}