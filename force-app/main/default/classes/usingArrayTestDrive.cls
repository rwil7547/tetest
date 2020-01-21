@isTest 

public class usingArrayTestDrive{

public static testMethod void createAccount(){

    Account p = new Account();
    p.Name    = 'Hollallola';
    
    insert p;
    
    List<Contact> newList = [SELECT Id FROM Contact WHERE Title = 'Homebase'];
    
    system.AssertEquals(5,newList.size());
    
    }
}