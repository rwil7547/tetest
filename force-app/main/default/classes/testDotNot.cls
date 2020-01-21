@isTest
public class testDotNot{

    public static testMethod void takeALook(){
    
        Account w = new Account();
        w.Name = 'Tester';
        insert w;
        
        system.Debug('Account ID is ' + w.Id);
    
        Opportunity p =  new Opportunity();
        p.Accountid = w.id;
        p.Name = 'Tester';
        p.CloseDate = Date.today();
        p.Amount = 5;
        p.StageName = 'Prospecting';
        p.ForecastCategoryName = 'Pipeline';
        insert p;
        
        system.Debug('Opportunity account ID is ' + p.Accountid); 
        system.Debug('Opportunity Name is ' + p.Name);         
		
        Opportunity opp = [SELECT Id, Name FROM Opportunity WHERE Account.Name = 'Tester'];
        
        List<Account> updatedAcc =  [SELECT Id,AccountNumber FROM Account WHERE AccountNumber = :opp.Name];
        
        system.AssertEquals(1,updatedAcc.size());
        }
        
}