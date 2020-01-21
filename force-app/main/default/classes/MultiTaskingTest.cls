@isTest
private class MultiTaskingTest {
	
	@isTest static void insertAccountWithOne() {
		// Create an account and select three options in the field
		Account m 			= new Account();
		m.Name				= 'test';
		m.Picklist_Fun__c 	= 'Bruce';
		insert m;

		List<Task> tasksFound = [SELECT id FROM Task WHERE what.id = :m.id];

		system.assertEquals(1,tasksFound.size());
	}
	
	@isTest static void insertAccountWithNone() {
		// Create an account and select no options in the field
		Account p 			= new Account();
		p.Name				= 'test';
		insert p;

		List<Task> tasksFound = [SELECT id FROM Task WHERE what.id = :p.id];

		system.assertEquals(0,tasksFound.size());
	}
	
}