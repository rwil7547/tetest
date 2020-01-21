trigger UpdateOwner on Case (after insert) {

	List<Contact> toUpdateList = new List<Contact>();
	List<Account> accountstoUpdateList = new List<Account>();

	for (Case c : trigger.new){
		if (c.ContactId != null){
			Contact newCont  = new Contact();
			newCont.id 		 = c.ContactId;
			newCont.OwnerId	 = c.CreatedById;
			toUpdateList.add(newCont);
		}

		if (c.AccountId != null){
			Account a  		= new Account();
			a.Id 			= c.AccountId;
			a.OwnerId		= c.CreatedById;
			accountstoUpdateList.add(a);
		}
	}

	update toUpdateList;
	update accountstoUpdateList;	

}