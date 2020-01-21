@isTest
public class testingCaller{

     public static testMethod void createAccount1(){
     
 
          
     Account p = new Account();
     p.Type = 'Prospect';
     p.Name = 'Homebase';
     insert p;
     List<Contact> testCont = [SELECT Id FROM Contact WHERE FirstName = 'Rosie'];    
     system.AssertEquals(5,testCont.size());
     
     Account q = new Account();
     q.Type = 'Customer';
     q.Name = 'Homebase';
     insert q;
     List<Contact> testCont2 = [SELECT Id FROM Contact WHERE FirstName = 'Rosie'];      
     system.AssertEquals(9,testCont2.size());
     
     Account e = new Account();
     e.Type = 'Other';
     e.Name = 'Homebase';
     insert e;
     List<Contact> testCont3 = [SELECT Id FROM Contact WHERE FirstName = 'Rosie']; 
     system.AssertEquals(12,testCont3.size());
     
     
     }
     
     public static testMethod void createContact1(){
     
     Contact Ronan = new Contact();
     Ronan.FirstName = 'Ronan';
     Ronan.LastName = 'Williams';
     Ronan.Fax = '1.14';
     
     insert Ronan;
     
     system.Debug('His Fax is ' + Ronan.Fax);
     system.assertEquals(makeAContact.returnMyNumber(),Ronan.Fax);
     }
     
     
}