@isTest
public class FixCreatorTest {
    
    public static testMethod void leaveCreator(){
        
        Case c = new Case();
        c.OwnerId = [SELECT Id FROM User LIMIT 1].Id;
        C.Status = 'New';
        c.Origin = 'Phone';
        insert c;
        
        System.assertEquals(1, [SELECT id FROM Case].size());
        
        User u = [SELECT FirstName, Email FROM User WHERE Email = 'test@test.com' LIMIT 1];
        System.Debug('Random user first name is ' + u.FirstName + ' and email ' + u.Email);

		Case ins = [SELECT id, OwnerId, Owner.LastName FROM Case];
		System.Debug('The owner id is ' + ins.OwnerId + ' and the last name is ' + ins.Owner.LastName);        
    }

    public static testMethod void fixCreator(){
       
        Case c = new Case();
        c.OwnerId = [SELECT Id FROM User LIMIT 1].Id;
        C.Status = 'New';
        c.Origin = 'Phone';
        c.Subject = 'test@test.com';
        insert c;
        
        Case inserted = [SELECT id, CreatedById, CreatedBy.FirstName, CreatedBy.Email FROM Case];
        User u = [SELECT Id, FirstName, Email FROM User WHERE Email = 'test@test.com' LIMIT 1];        
        System.Debug('case owner id is ' + inserted.CreatedById + ' and test user id is ' + u.Id);

        
        System.assertEquals(1, [SELECT id FROM Case WHERE createdbyId = :u.Id ].size());        
    }    
    
    
}