@isTest
public class TestRestrictContactByName {
    
    public static testMethod void conWithValidName(){
        Contact con = new Contact(FirstName='Ronan', LastName='Williams');
        insert con;
        
        List<Contact> inserted = [SELECT Id FROM Contact WHERE LastName='Williams'];
        System.AssertEquals(1,inserted.size());
    }
    
    public static testMethod void conWithInvalidName(){
        Contact con = new Contact(FirstName='Ronan', LastName='INVALIDNAME');
        insert con;
        
        List<Contact> inserted = [SELECT Id FROM Contact WHERE LastName='INVALIDNAME'];
        System.AssertEquals(0,inserted.size());        
        
    }

}