@isTest
public class BatchOppTaskTest {
    
    public static testMethod void executeBatch(){
        /*
        List<Task> priortasks = [SELECT Id FROM Task];
        
        System.assertEquals(0, priortasks.size());        
        
        for (Integer x=0; x<10; x++){
            Opportunity o = new Opportunity();
            if (x < 5){
                o.StageName = 'Prospecting';
            } else {
                o.StageName = 'Closed Won';
            }
            o.Name = 'Test Opp ' + x;
            o.CloseDate = Date.today() - 1;
            o.Amount = 100 * x;
            insert o;
        }
        
        List<Opportunity> allInserts = [SELECT Id FROM Opportunity];
        
        System.debug('Number of inserted opps is ' + allInserts.size());
        
        Test.startTest();
        AddBatchOppTask add =  new AddBatchOppTask();
        Id batchid = Database.executeBatch(add);
        Test.stopTest();
        
        List<Task> tasks = [SELECT Id FROM Task WHERE Subject LIKE '%ASAP%'];
        
        System.assertEquals(5, tasks.size());
		*/
       
    }

}