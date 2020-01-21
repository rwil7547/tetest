@isTest
public class LeadProcessorTest {
    
    @isTest
    public static void testBacth () {
        
        List<Contact> toInsert = new List<Contact>();
        
        for (Integer x=0; x < 200; x++){
            toInsert.add(new Contact(LastName = 'Name ' + x));
        }
        
        insert toInsert;
        System.Debug('Numebr of contacts inserted is ' + toInsert.size());
        
        test.StartTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        test.stopTest();
        
        List<Contact> updated = [SELECT Id FROM Contact
                                WHERE LeadSource = 'Dreamforce'];
        
        System.assertEquals(200, updated.size());
        
    }

}