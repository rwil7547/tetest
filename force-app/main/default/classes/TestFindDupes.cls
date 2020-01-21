@isTest
public class TestFindDupes {
    static testMethod void testDupes() {
    
        Contact c = new Contact();
        c.FirstName = 'Stephen';
        c.LastName = 'Curry';
        c.Email = 'stephencurry@gmail.com';
        insert c;
        
        Lead dupeLead = new Lead();
        dupeLead.FirstName = 'Steph';
        dupeLead.LastName = 'Curry';
        dupeLead.Company = 'GWS Ltd';
        dupeLead.Email = 'stephencurry@gmail.com';
        
        try {
            insert dupeLead;
        } catch (Exception e) {
            System.debug ('An error happened, as predicted!');
        }
        
        List<Lead> dupes = [SELECT Id FROM Lead
                                        WHERE Email = 'stephencurry@gmail.com'];
        System.assertEquals(0, dupes.size());
        
        Lead legitLead  = new Lead();
        legitLead.FirstName = 'David';
        legitLead.LastName  = 'Liu';
        legitLead.Company   = 'Salesforce';
        legitLead.Email     = 'dliu@salesforce.com';
        insert legitLead;
        
        List<Lead> legits = [SELECT Id FROM Lead 
                                        WHERE Email = 'dliu@salesforce.com'];
        System.assertEquals(1, legits.size());
        
    }

}