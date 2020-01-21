@isTest
public class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @testSetup
    public static void createLeads() {
        
        List<Lead> leads = new List<Lead>();
        
        for (Integer x=0; x < 200; x++) {
            leads.add(new Lead(LastName = 'Lead ' + x, Company = 'Test'));
        }
        
        System.debug('Number of leads to be inserted is ' + leads.size());
        
        insert leads;
       
    } 
    
    @isTest
    public static void scheduleLeadProcessor() {
        
        Test.startTest();
        String jobId = System.Schedule('ScheduledApexTest',
                                      CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        System.assertEquals(200, [SELECT Id FROM Lead WHERE LeadSource = 'Dreamforce'].size());
        
    }

}