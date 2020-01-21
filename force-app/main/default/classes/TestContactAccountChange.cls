@isTest
public class TestContactAccountChange {
    static testMethod void CreateNewContact() {
    
        Contact contactToCreate = new Contact();
        
        contactToCreate.LastName = 'Phil';
        
        insert contactToCreate;
        }
        
}