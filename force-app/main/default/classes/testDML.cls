@isTest
public class testDML{

    public static testMethod void comeOn(){

    Account o = new Account();
    o.Name = 'Ping';

    insert o;

    List<Contact> myContacts = [SELECT Id FROM Contact WHERE LastName = 'Marfleet'];
    
    system.AssertEquals(0,myContacts.size());
    }


    public static testMethod void comeOff(){

    Account o = new Account();
    o.Name = 'Homebase';

    insert o;

    List<Contact> myContacts = [SELECT Id FROM Contact WHERE LastName = 'Marfleet'];
    
    system.AssertEquals(5,myContacts.size());
    }
}