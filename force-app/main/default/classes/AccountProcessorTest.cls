@isTest
public class AccountProcessorTest {
    
    @isTest
    public static void testUpdate() {
        
        List<Id> accIds = new List<Id>();
        
        for (integer x=0; x < 10; x++){
            Account acc = new Account(Name = 'Account' + x);
            insert acc; 
            accIds.add(acc.Id);
            Contact con = new Contact(LastName = 'Last Name ' + x,
                                     AccountId = acc.Id);
            insert con;     
        }
        
        System.debug('Number of accs inserted is ' + accIds.size());
        
        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        
        List<Account> updatedAccs = [SELECT Id, Number_of_Contacts__c
                                    FROM Account 
                                    WHERE Number_of_Contacts__c = 1];
        
        System.assertEquals(10, updatedAccs.size());
        
    }

}