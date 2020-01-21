@isTest
public class TestAddCSR {
    
    @isTest static void testCSR(){
        insert new CSR_Settings__c(Name='csr', 
                                   CSR_User_ID__c=[SELECT Id FROM User LIMIT 1].Id,
            					   Opp_Minumum_Value__c = 6000);
        
        Account a = new Account(
        	Name = 'Test', 
        	Industry = 'Government');
        insert a;
        
        Opportunity o = new Opportunity(
        	Name = 'test',
        	CloseDate = Date.today(),
        	Amount = 8000,
        	StageName = 'Prospecting',
        	AccountId = [SELECT Id FROM Account].Id);
        insert o;
	
        Account acc = [SELECT CSR__c, Id 
                       FROM Account 
                      WHERE Name = 'Test'];
        
        System.Assert(acc != null);
        System.Assert(acc.CSR__c != null);
    }

}