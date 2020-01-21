public class SpecialLeadConvert {

	// our class instance variables 
	List<Lead>			leads;
	List<Member__c> 	members;

	// our class constructor 
	public SpecialLeadConvert(List<Lead> leadList) {
		leads 			= leadList;
		members 		= new List<Member__c>();
	}

	// method for converting leads to members, instead of contacts
	public void convertToMembers() {
		for (Lead l : leads){
			Member__c member 	= new Member__c();
			member.Name 		= l.FirstName + ' ' + l.LastName;
			member.Email__c		= l.Email;
			members.add(member);
		}

		insert members;


		
	}

	// method to get our member list 
	public List<Member__c> getMembers(){
		return members;
	}
}