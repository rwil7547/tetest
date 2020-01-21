@isTest
private class AddManagerTest {
	
	@isTest static void HasNoManager() {
		// create opportunity
		Opportunity o  	= new Opportunity();
		o.CloseDate		= Date.today();
		o.Amount 		= 2000;
		o.Name 			= 'Test';
		o.StageName 	= 'Closed Won';
		o.OwnerId		= UserInfo.getUserId();
		insert o;

		List<OpportunityTeamMember> members = [SELECT   id 
												FROM 	OpportunityTeamMember
												WHERE 	OpportunityId = : o.id];

		system.assertEquals(1,members.size());

		// query to see if it has team members
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}