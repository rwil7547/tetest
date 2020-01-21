public class test_opportunity_contact_required {


// test to ensure an opportunity can be added

public static testMethod void testoppyrequired0()
    {
        //create oppty 
        List<Opportunity> oppy = new List<Opportunity>();
                                    
        //add 10 opportunites without a contact, and with the condition contact required = 0
        
        for (Integer i = 0; i < 10; i++) {
            oppy.add(new Opportunity(Name='nick_test'+i,StageName='Perception Analysis',CloseDate=System.Today()));
        }
        insert oppy;
        
        map<Id, Opportunity> oppy_map = new map<Id, Opportunity>();
        
        for (Integer i = 0;i<10;++i){
            oppy_map.put(oppy[i].Id,oppy[i]);
        } //for
        
        System.assert([SELECT count() FROM Opportunity WHERE Id IN :oppy_map.keySet()] == 10);   
    } //testoppyrequired = 0
    
    
    //test to go from a not required value to a required value

public static testMethod void testoppyrequired1()
    {   
            //create oppty 
            List<Opportunity> oppy2 = new List<Opportunity>();
                                        
            //add 10 opportunites without a contact, and with the condition contact required = 0       
            for (Integer i = 0; i < 10; i++) {
                oppy2.add(new Opportunity(Name='nick_test'+i,StageName='Qualification',CloseDate=System.Today()));
            }
            
            insert oppy2;
            
            for (Integer i = 0; i < 10; i++) {
                
          	  oppy2[i].StageName='Negotiation/Review';
            
            }

			Test.startTest();

			try {
			
			    update oppy2;
			    
			    Opportunity sampleTest = [Select Id, Contact_Required__c From Opportunity where Id = :oppy2[0].id];
			    
			    System.debug('*****SAMPLE' + sampleTest);
			    
			    System.assert(false, 'This update should have failed.');
			
			} catch(System.DmlException e) {
			
			    System.assert(e.getMessage().contains('No Primary Contact Exists.'));
			
			}

    		Test.stopTest();
       
 
    } //testoppyrequired = 1



public static testMethod void testoppyrequired1woprimary()
    {   
            //create oppty 
            List<Opportunity> oppy = new List<Opportunity>();
                                        
            //add 10 opportunites 
                    
            for (Integer i = 0; i < 10; i++) {
                oppy.add(new Opportunity(Name='nick_test'+i,StageName='Qualification',CloseDate=System.Today()));
            }
            
            insert oppy;
            
            //add 10 contacts
            
            List<Contact> c = new List<Contact>();
                                        
    
            for (Integer i = 0; i < 10; i++) {
                c.add(new Contact(LastName='nick_test'+i));
            }

            insert c;

            for (Integer i = 0; i < 10; i++) {
                
            oppy[i].StageName='Negotiation/Review';
            
            }

            //add 10 opporunity contact roles associated to the opportunities and contacts above
            
            List<OpportunityContactRole> ocr = new List<OpportunityContactRole>();
            
            for (Integer i = 0; i < 10; i++) {
                ocr.add(new OpportunityContactRole(Role='Business User',OpportunityId=oppy[i].id,ContactId=c[i].id));
            }
            
            insert ocr;
            
boolean caughtException = false;


Test.startTest();

try {

    update oppy;

} catch(System.DmlException e) {

    System.assert(e.getMessage().contains('No Primary Contact Exists.'));

    caughtException = true;

}

    Test.stopTest();

    System.assert(caughtException);         
 
    } //testoppyrequired = 1


public static testMethod void testoppyrequired1primary()
    {   
            //create oppty 
            List<Opportunity> oppy = new List<Opportunity>();
                                        
            //add 10 opportunites 
                    
            for (Integer i = 0; i < 10; i++) {
                oppy.add(new Opportunity(Name='nick_test'+i,StageName='Qualification',CloseDate=System.Today()));
            }
            
            insert oppy;
            
            map<Id, Opportunity> oppy_map = new map<Id, Opportunity>();
            
            for (Integer i = 0;i<10;++i){
                oppy_map.put(oppy[i].Id,oppy[i]);
            } //for
            
            //add 10 contacts
            
            List<Contact> c = new List<Contact>();
                                        
    
            for (Integer i = 0; i < 10; i++) {
                c.add(new Contact(LastName='nick_test'+i));
            }

            insert c;

            //add 10 opporunity contact roles associated to the opportunities and contacts above
            
            List<OpportunityContactRole> ocr = new List<OpportunityContactRole>();
            
            for (Integer i = 0; i < 10; i++) {
                ocr.add(new OpportunityContactRole(Role='Business User',OpportunityId=oppy[i].id,ContactId=c[i].id,IsPrimary=True));
            }
            
            insert ocr;
            
            for (Integer i = 0; i < 10; i++) {
                
            oppy[i].StageName='Negotiation/Review';
            
            }

			try {
			
			    update oppy;
			    
			        System.assert([SELECT count() FROM Opportunity
			            WHERE Id IN :oppy_map.keySet()] == 10);
			
			} catch(System.DmlException e) {
			
			    System.assert(false);
			
			}   
 
    } //testoppyrequired = 1 and primary contact = true

} //test class