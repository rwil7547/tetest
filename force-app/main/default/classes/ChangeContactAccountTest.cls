@isTest
private class ChangeContactAccountTest {
	
	@isTest static void ChangeDetails() {
		// Create account with website
		Account a 	= new Account();
		a.Name 		= 'Ron';
		a.Website	= 'www.ron.com';
		insert a;

		// Create account without website 
		Account b 	= new Account();
		b.Name 		= 'Bon';
		insert b;

		// create contact no email
		Contact c 	= new Contact();
		c.FirstName = 'Ronaldo';
		c.LastName 	= 'Baldwin';
		c.AccountId	= b.Id;
		insert c;

		// create contact with matching email
		Contact d 	= new Contact();
		d.FirstName = 'Ronaldo';
		d.LastName 	= 'Baldwin';
		d.Email 	= 'ronaldo@ron.com';
		d.AccountId	= b.Id;
		insert d;

		List<Contact> unchanged = [SELECT Id
									FROM  Contact
									WHERE Accountid = :b.id];

		List<Contact> changed =   [SELECT Id
									FROM  Contact
									WHERE Accountid = :a.id];

		system.assertEquals(1,unchanged.size());
		system.assertEquals(1,changed.size());

	}
	
}