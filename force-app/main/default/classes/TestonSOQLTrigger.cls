@isTest
public class TestonSOQLTrigger {
    static testMethod void insertNewContact() {
    
        Contact testContact =  new Contact ();
        
        testContact.FirstName = 'Paul';
        testContact.LastName = 'Ryan';
        
        insert testContact;
        }
    
 }