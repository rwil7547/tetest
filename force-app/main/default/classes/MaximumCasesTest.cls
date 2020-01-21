@isTest
public class MaximumCasesTest {
    
    private static testMethod void testTooMany(){
        
        User u= [SELECT id, FirstName From User LIMIT 1];
        
        system.Debug(u.FirstName);
       
        List<Case> allNinetyNine = new List<Case>();
        
        for(Integer x=0; x<99; x++){
            Case c = new Case();
            c.Status = 'New';
            c.OwnerId = u.Id;
            c.Priority= 'High';
            c.Description = 'Loaded by MaximumCasesTest' ;
            c.CreatedById = u.id;
            allNinetyNine.add(c);
        }
        
        insert allNinetyNine;
        
        List<Case> inserted = [SELECT id FROM Case];
        
        System.Debug('num inserted is ' + inserted.size());
        
        Case lastOne = new Case();
        lastOne.Status = 'New';
        lastOne.Priority= 'High';
        lastOne.Description = 'The last one';
        lastOne.CreatedById = u.id;
        
        try { 
            insert lastOne;
        } catch (Exception e){
            Boolean expectedExceptionThrown =  e.getMessage().contains('Too many cases');
            System.debug(e.getMessage());
            System.AssertEquals(expectedExceptionThrown, true);
        }
        
        List<Case> insertedLater = [SELECT id FROM Case];
        System.debug('final num inserted is ' + insertedLater.size());
        System.AssertEquals(inserted.size(),insertedLater.size());            
          
        
        
    }

}