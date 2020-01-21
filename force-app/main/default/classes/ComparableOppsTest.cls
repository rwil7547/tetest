@isTest 
private class ComparableOppsTest {
	
	@isTest static void HasComparables() {
		// create two comparables
		Account a 			= new Account();
		a.Name 				= 'Philly';
		a.Industry			= 'Government';
		insert a;	

		for(Integer i=0; i<3; i++){
			Opportunity o 	= new Opportunity();
			o.Name			= 'Opp ' + i;
			o.Account		= a;
			o.Amount		= 3000;
			o.StageName		= 'Closed Won';
			o.CreatedDate	= Date.today() - 380;
			o.CloseDate		= Date.today();
			o.ForecastCategoryName = 'Pipeline';
			insert o;
		}

		Opportunity test 	= new Opportunity();
		test.Name 			= 'Test';
		test.Amount 		= 3000;
		test.StageName		= 'Closed Won';
		test.CloseDate		= Date.today();
		test.ForecastCategoryName = 'Pipeline';
		insert test;

		List<Comparable__c> oppWithComps = [SELECT  Id
											FROM  	Comparable__c
											WHERE 	Base_Opportunity__r.id = :test.id];

		system.debug('List of oppWithComps size is ' + oppWithComps.size());
		system.assertEquals(3,oppWithComps.size());


	}
	
	@isTest static void NoComparables() {
		// create and insert opp with no comparables
		Opportunity test 	= new Opportunity();
		test.Name 			= 'Test';
		test.Amount 		= 3000;
		test.StageName		= 'Closed Won';
		test.CloseDate		= Date.today();
		test.ForecastCategoryName = 'Pipeline';
		insert test;

		List<Comparable__c> oppWithComps = [SELECT   Id
											FROM  	 Comparable__c
											WHERE 	 Base_Opportunity__r.id = :test.id];

		system.debug('List of oppWithComps size is ' + oppWithComps.size());
		system.assertEquals(0,oppWithComps.size());
	}
	
}