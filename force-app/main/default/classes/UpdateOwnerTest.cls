@isTest
private class UpdateOwnerTest {
	
	@isTest static void CreateCaseWithContact() {
		
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


		// create Contact
		Contact c 		=  new Contact();
		c.FirstName 	= 'Pete';
		c.LastName		= 'Philly';
		c.OwnerId 		= u.id;
		insert c;

		// create Case
		Case ca 		= new Case();
		ca.ContactId	= c.Id;
		ca.Status		= 'New';
		ca.Origin		= 'Email';
		insert ca;

		List<Contact> updated = [SELECT Id, OwnerId
								FROM 	Contact
								WHERE 	Ownerid = :u.id];

		List<Contact> updated2 = [SELECT Id, OwnerId
								FROM 	Contact
								WHERE 	Ownerid = :UserInfo.getUserId()];

		system.assertEquals(0,updated.size());
		system.assertEquals(1,updated2.size());

	}
	
	@isTest static void CreateCaseWithAccount() {
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


		// create Account
		Account c 		=  new Account();
		c.Name		 	= 'Pete';
		c.OwnerId 		= u.id;
		insert c;

		// create Case
		Case ca 		= new Case();
		ca.AccountId	= c.Id;
		ca.Status		= 'New';
		ca.Origin		= 'Email';
		insert ca;

		List<Account> updated = [SELECT Id, OwnerId
								FROM 	Account
								WHERE 	Ownerid = :u.id];

		List<Account> updated2 = [SELECT Id, OwnerId
								FROM 	Account
								WHERE 	Ownerid = :UserInfo.getUserId()];

		system.assertEquals(0,updated.size());
		system.assertEquals(1,updated2.size());
	}
	
}