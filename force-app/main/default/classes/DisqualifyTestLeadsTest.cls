@isTest
private class DisqualifyTestLeadsTest {
	
	@isTest static void createLeadWithTest() {
		Lead t 			= new Lead();
		t.FirstName 	= 'test';
		t.LastName 		= 'test';
		t.Company 		= 'hkjhkj';
		t.Status 		= 'Open - Not Contacted';
		insert t;

		List<Lead> myLeads = [SELECT id FROM Lead WHERE Status = 'Disqualified'];
		system.assertEquals(1,myLeads.size());
		system.debug('Lead with id ' + t.Id + ' inserted');
		system.debug('Lead status is ' + t.Status);
	}
	
	@isTest static void createLeadWithoutTest() {
		Lead n 			= new Lead();
		n.FirstName 	= 'dfsgsg';
		n.LastName 		= 'hooo';
		n.Company		= 'hkjhkj';
		n.Status 		= 'Open - Not Contacted';
		insert n;

		List<Lead> myLeads = [SELECT id FROM Lead WHERE Status = 'Disqualified'];
		system.assertEquals(0,myLeads.size());
	}
	
}