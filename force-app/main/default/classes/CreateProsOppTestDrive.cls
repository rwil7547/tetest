@isTest
Private class CreateProsOppTestDrive{

    Static testMethod void createContactRonan(){
    
        List<Contact> toBeAdded     = new List<Contact>();
        
        Contact newCont             = new Contact();
        newCont.FirstName           = 'Ronan';
        newCont.LastName            = 'Phillips';
        toBeAdded.add(newCont);
        insert toBeAdded;
        
        List<Contact> conList       = [SELECT Id,LastName
                                        FROM Contact 
                                        WHERE LastName = 'Peligroso'];
        system.AssertEquals(1,conList.size());
    
        List<Opportunity> checkOpps = [SELECT Id,Name 
                                        FROM Opportunity 
                                        WHERE Name = 'We Made It Baby!'];
        system.AssertEquals(1,checkOpps.size());
    
        List<Account> checkAccs     = [SELECT Id,Name 
                                        FROM Account
                                        WHERE Name = 'Gefahrlich Ltd.'];
        system.AssertEquals(0,checkAccs.size());
    
    }
    
    Static testMethod void createContactNotRonan(){
    
        Contact secondCont          = new Contact();
        secondCont.FirstName        = 'Paddy';
        secondCont.LastName         = 'Williams';
        insert secondCont;
    
        List<Contact> checkUp       = [SELECT Id,LastName
                                        FROM Contact 
                                        WHERE LastName = 'Gefahrlich'];
        system.AssertEquals(1,checkUp.size());
    
        List<Opportunity> checkOpps = [SELECT Id,Name 
                                        FROM Opportunity 
                                        WHERE Name = 'We Made It Baby!'];
        system.AssertEquals(0,checkOpps.size());
    
        List<Account> checkAccs     = [SELECT Id,Name 
                                        FROM Account 
                                        WHERE Name = 'Gefahrlich Ltd.'];
        system.AssertEquals(1,checkAccs.size());
    }
}