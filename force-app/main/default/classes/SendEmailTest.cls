@isTest
public class SendEmailTest {
    
    public static testMethod void insertAccount(){
        Account a =  new Account();
        a.Name = 'Polity';
        a.Email__c = 'ronanjwilliams@gmail.com';
        
        Test.startTest();
        insert a;
        Test.stopTest();
        
    }

}