public with sharing class PageController {

	public class MyWrapper{

		public Contact con {get; private set;}
		public Opportunity opp {get; private set;}

		public MyWrapper(Contact c, Opportunity o){
			this.con = c;
			this.opp = o;

		}

	}

	// prototype list memebr
	public List<MyWrapper> wrapperList {get; private set;}

	// constructor 
	public PageController() {

		// create contact map
		Map<Id, Contact> conMap = new Map<Id, Contact>([SELECT id, Name FROM Contact
				WHERE Id IN (SELECT ContactId FROM OpportunityContactRole WHERE IsPrimary = true)]);

		// create opportunity map
		Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>([SELECT id, Name FROM Opportunity
			WHERE Id IN (SELECT OpportunityId FROM OpportunityContactRole WHERE IsPrimary = true)]);

		// create junction list to iterate	
		List<OpportunityContactRole> oppConRoles = [SELECT OpportunityId, ContactId FROM OpportunityContactRole];

		// initialise and populate wrapper list
		this.wrapperList = new List<MyWrapper>();
		for(OpportunityContactRole ocr : oppConRoles){
			this.wrapperList.add(new MyWrapper(conMap.get(ocr.ContactId), oppMap.get(ocr.OpportunityId)));
		}


		
	}
}