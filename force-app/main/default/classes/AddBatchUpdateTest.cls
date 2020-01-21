@isTest
public class AddBatchUpdateTest {
    
    public static testMethod void testBacthupdate(){
        for (Integer i=0; i<100; i++){
            Contact con = new Contact();
            con.FirstName = 'James';
            con.LastName = 'Phillips';
            insert con;
        }
        
        List<Contact> allCons = [SELECT id, LastName
                                FROM Contact];
        
        System.Debug('Number of contacts in database is ' + allCons.size());
        
        Test.startTest();
        AddBatchUpdate testUpdate = new AddBatchUpdate();
        Id updateId = Database.executeBatch(testUpdate);
        Test.stopTest();
        
        System.assertEquals(100, [SELECT iD,LastName FROM Contact WHERE LastName LIKE '%Update%'].size());
        
    }

}