@isTest
private class CloseCaseTest {
	
	@isTest static void NoCases() {
		
		// create a new account and contact
		Account a 		= new Account();
		a.Name			= 'Winterfell';
		insert a;

		Contact con 	= new Contact();
		con.FirstName	= 'Ronan';
		con.LastName 	= 'Williams';
		con.AccountId	= a.Id;
		insert con;

		// Create one new case
		Case c 			= new Case();
		c.Origin		= 'Phone';
		c.Status 		= 'New';
		c.ContactId		= con.Id;
		insert c;

		system.Debug('Cases status is ' + c.Status);
		system.AssertEquals('New',c.Status);

	}
	
	@isTest static void ThreeCases() {
		// create a new account and contact
		Account a 		= new Account();
		a.Name			= 'Winterfell';
		insert a;

		Contact con 	= new Contact();
		con.FirstName	= 'Ronan';
		con.LastName 	= 'Williams';
		con.AccountId	= a.Id;
		insert con;

		// Create one new case
		for (Integer i = 0; i < 3; i++){
			Case c 			= new Case();
			c.Origin		= 'Phone';
			c.Status 		= 'New';
			c.ContactId		= con.Id;
			c.Description	= string.Valueof(i);
			insert c;		
		}

		Case finalInsert 		= new Case();
		finalInsert.Origin		= 'Phone';
		finalInsert.Status 		= 'New';
		finalInsert.ContactId	= con.Id;
		insert finalInsert;		

		
		Case finalc 		= 	[SELECT Status
							FROM    Case
							WHERE   id = :finalInsert.id
							LIMIT   1];
		system.assertEquals('Closed',finalc.Status);

	}
	
}