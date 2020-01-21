@isTest
private class UpdateOppOwnerTest {
	
	@isTest static void UpdateOwnerNoEmail() {
		// create User
		User u 			= new User();
		u.FirstName 	= 'p';
		u.LastName 		= 'r';
		u.Email			= 'p@r.com';
		u.Username 		= 'p@r.com';
		u.Alias			= 'redhead';
		u.ProfileId		= [SELECT id FROM Profile WHERE Name = 'System Administrator'].id;
		u.TimeZoneSidKey 		= 'America/Denver';
		u.LocaleSidKey			= 'en_US';
		u.EmailEncodingKey 		= 'UTF-8';
		u.LanguageLocaleKey		= 'en_US';
		insert u;

		// create Opporttunity which contains user email
		Opportunity o 		= new Opportunity();
		o.Name		  		= 'New Opp';
		o.CloseDate	  		= Date.Today();
		o.StageName   		= 'Closed Won';
		o.Owner_Email__c 	= 'p@r.com';
		insert o;

		// check that the opp contains the user as the Owner 
		Opportunity opp = [SELECT id, OwnerId 
							FROM 	Opportunity
							WHERE   Id = :o.Id
							LIMIT 	1];

		system.assertEquals(u.Id,opp.OwnerId);	


	}
	
	@isTest static void UpdateOwnerWithEmail() {
		// Implement test code
	}
	
}