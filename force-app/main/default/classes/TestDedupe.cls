@isTest
private class TestDedupe {
	
	@isTest static void createLeadNoDupes() {
		String leadOwner = UserInfo.getUserId();

		// Create all required records
		Lead myLead			= new Lead();
		myLead.FirstName 	= 'Sansa';
		myLead.LastName 	= 'Stark';
		myLead.Company		= 'Winterfell Hotels';
		myLead.Email		= 'sstark@winterfellhotels.com';
		myLead.Description 	= 'The North Remembers';
		myLead.OwnerId		= leadOwner;
		insert myLead;

		// use soql to find the latest values
		Lead updatedLead = [SELECT OwnerId,
									Description
							FROM    Lead
							WHERE 	Id = :myLead.id];


		// assert that the results are as expected
		System.assertEquals(leadOwner, updatedLead.OwnerId);
		System.assertEquals(myLead.Description,updatedLead.Description);


	}
	
	@isTest static void createLeadMultipleDupes() {
		// create two contacts
		string  email= 'sstark@winterfellhotels.com';
		List<Contact> dupeContacts = new List<Contact>();

		Contact firstDupe		= new Contact();
		firstDupe.FirstName		= 'Sansa';
		firstDupe.LastName 		= 'Stark';
		firstDupe.Email			= email;
		dupeContacts.add(firstDupe);

		Contact secondDupe		= new Contact();
		secondDupe.FirstName		= 'Sansa';
		secondDupe.LastName 		= 'Stark';
		secondDupe.Email			= email;
		dupeContacts.add(secondDupe);
		insert dupeContacts;

		// Create a matching lead
		Lead mylead  		= new Lead();
		myLead.FirstName	= 'Sansa';
		myLead.LastName		= 'Stark';
		myLead.Company		= 'winterfellhotels';
		myLead.Email		= email;
		myLead.OwnerId		= UserInfo.getUserId();
		myLead.Description 	= 'The North Remembers';
		insert myLead;

		Lead updatedLead 	= 	   [SELECT  OwnerId,
											Description
									FROM 	Lead
									WHERE 	Id = :mylead.id];

		Group dataQualityQueue = 	[SELECT  Id
									FROM	 Group
									WHERE 	 DeveloperName = 'Data_Quality'
									LIMIT 	1 ];
									

		system.assertEquals(dataQualityQueue.id, updatedLead.OwnerId);
		system.assert(updatedLead.Description.contains(firstDupe.id));
		system.assert(updatedLead.Description.contains(secondDupe.id));


	}
	
}