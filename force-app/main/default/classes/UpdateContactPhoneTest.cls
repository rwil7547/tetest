@isTest
private class UpdateContactPhoneTest  {
	
	@isTest static void ChangePhone() {
		// Create Account
		Account a 	= new Account();
		a.Name 	 	= 'McDonalds';
		a.Phone 	= '02084812000';
		insert a;

		// Create Contact
		Contact c 	= new Contact();
		c.FirstName = 'Con';
		c.LastName 	= 'Artist';
		c.AccountId	= a.id;
		insert c;
		
		system.Debug('New contacts other phone is currently ' + c.OtherPhone);		

		// Change Account phone 
		a.Phone 	= '020848018888';
		update a;

		// query contact number 
		Contact con =  [SELECT id, OtherPhone 
						FROM Contact
						WHERE AccountId = :a.Id];

		system.assertEquals(a.Phone,con.OtherPhone);
	}
	
}