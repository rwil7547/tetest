@isTest
private class UsePickListCounterTest {
	
	@isTest static void addThreeValues() {
		Account a 			= new Account();
		a.Name				= 'Test';
		a.Picklist_Fun__c	= 'Toby';
		a.Picklist_Fun__c	+= ';' + 'Bruce';
		a.Picklist_Fun__c	+= ';' + 'Debbie';
		insert a;

		List<Account> completedAccounts = [SELECT id FROM Account WHERE Counter__c = 3];

		System.assertEquals(1,completedAccounts.size());

	}
	
	@isTest static void addNoValues() {
		Account b			= new Account();
		b.Name				= 'Second Test';
		insert b;

		List<Account> completedAccounts = [SELECT id FROM Account WHERE Counter__c = 0];
		System.assertEquals(1,completedAccounts.size());

	}
	
}