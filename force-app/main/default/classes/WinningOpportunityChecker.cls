public with sharing class WinningOpportunityChecker {
	
	Map<Id,Opportunity> oldOpps;
	Map<Id,Opportunity> newOpps;

	// this is our constructor - recieves the maps of old and new opps in the trigger
	public WinningOpportunityChecker(Map<Id,Opportunity> oldTriggerOpps, Map<Id,Opportunity> newTriggerOpps) {
		oldOpps = oldTriggerOpps;
		newOpps = newTriggerOpps;
	}

	// method called by master trigger
	public void checkWinningOpps(){
		for (Opportunity newOpp : newOpps.values()){
			Opportunity oldOpp = oldOpps.get(newOpp.id);
			if (oldOpp.StageName != 'Closed Won' && newOpp.StageName == 'Closed Won'){
				newOpp.Name = 'Blastoise';
			}
		}
	}

}