@isTest
private class OppMapTestDrive {
	
	@isTest static void oppWithEmail() {
		
		Opportunity r 			=  new Opportunity();
		r.Amount 				= 20;
		r.Name 					= 'Peace';
		r.CloseDate 			= Date.today();
		r.StageName 			= 'Prospecting';
		r.Description 			= 'ronanjwilliams@gmail.com';

		insert r;

		List<Opportunity> opps = [SELECT id FROM Opportunity WHERE Project_Manager__r.Name = 'Ronan Williams'];
		system.assertEquals(1, opps.size());

	}
	
	@isTest static void oppWithoutEmail() {

		Opportunity r 			=  new Opportunity();
		r.Amount 				= 20;
		r.Name 					= 'Peace';
		r.CloseDate 			= Date.today();
		r.StageName 			= 'Prospecting';

		insert r;

		List<Opportunity> opps = [SELECT id FROM Opportunity WHERE Project_Manager__r.Name = 'Ronan Williams'];
		system.assertEquals(0, opps.size());
	}
	
}