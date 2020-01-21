@isTest
public class TestSOQL {
    
    @isTest public static void testSOQL(){
        Opportunity o = new Opportunity(
        					Name = 'Test',
        					CloseDate = Date.today(),
        					Amount = 50,
        					StageName = 'Prospecting');
    	insert o;
        
        Opportunity o2 = new Opportunity(
        					Name = 'Test',
        					CloseDate = Date.today(),
        					Amount = 50,
        					StageName = 'Prospecting');
    	insert o2;  
        
        System.AssertEquals(2,[SELECT Id FROM Opportunity].size());
    }
    

}