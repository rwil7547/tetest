trigger CloseCase on Case (before insert) {


	// run a soql query to see if other cases exist with same contact
	for (Case c : trigger.new){
		if (c.Accountid != null){
			List<Case> sameAccounts = [SELECT id 
										FROM   Case
										WHERE  Accountid = :c.Accountid
										AND    CreatedDate = TODAY];

			if(sameAccounts.size() >= 3){
				c.Status = 'Closed';
				}
		}			

		if (c.ContactId != null && c.Status != 'Closed'){
			List<Case> sameContacts = [SELECT id 
										FROM   Case
										WHERE  Contactid = :c.Contactid
										AND    CreatedDate = TODAY];

			if(sameContacts.size() >= 2){
				c.Status = 'Closed';				
			}

		}

	}

}