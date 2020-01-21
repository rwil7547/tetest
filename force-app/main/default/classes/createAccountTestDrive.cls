@isTest

Private class createAccountTestDrive{

    static Testmethod void createNewProduct(){
    
    Product2 a                     = new Product2();
    a.Name                         = 'Live Interactive';
    a.CanUseQuantitySchedule       = true;
    
    insert a;
    
    List<Account> newAccounts = [SELECT Id, Name FROM Account WHERE Name = 'Patricia'];
    
    system.AssertEquals(newAccounts.size(),1);
    }
    
   
 }