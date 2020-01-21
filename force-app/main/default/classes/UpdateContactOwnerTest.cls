@isTest
public class UpdateContactOwnerTest {
    
    public static testMethod void insertContact(){
		test.startTest();
        Account acc = new Account();
        acc.Name = 'Foo';
        acc.OwnerId = UserInfo.getUserId();
        insert acc;
        System.Debug('Accounts owner Id is ' + acc.OwnerId);
        test.stopTest();
        
        Contact con = new Contact();
        con.LastName =  'Foo';
        con.AccountId = acc.Id;
        insert con;
        
        Contact result = [SELECT Id, OwnerId, Owner.FirstName 
                          FROM Contact 
                          WHERE Name = 'Foo'];
        
        System.Debug(result.Owner.FirstName);
        System.Debug('Contacts owner Id is ' + result.OwnerId);
        
        System.AssertEquals(UserInfo.getUserId(),result.OwnerId);
       
    }

}