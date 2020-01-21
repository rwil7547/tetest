@isTest
public class AddPrimaryContactTest {
    
    @testSetup
    public static void createAccounts() {
        
        List<Account> accounts = new List<Account>();
        
        for (Integer x = 0; x < 100; x++) {
            if (x < 50){
                accounts.add(new Account(Name='Account' + x, BillingCountry = 'United States', BillingState = 'California'));
            } else {
                accounts.add(new Account(Name='Account' + x, BillingCountry = 'United States', BillingState = 'New York'));
            }      
        }
        
        insert accounts;
    }
    
    @isTest
    public static void callQueueableClass(){
        
        Contact con = new Contact(LastName = 'Test');
        insert con;
        
        String state = 'California';
        
        AddPrimaryContact apc = new AddPrimaryContact(con, state);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        
        List<Contact> conAccs = [SELECT AccountId FROM Contact 
                                WHERE Account.BillingState = :state
                                AND LastName = 'Test'];
        
        System.debug('Number of accounts in systen is ' + [SELECT Id FROM Account].size());
        System.AssertEquals(50, conAccs.size());
    }

}