trigger SendEmailonWon on Opportunity (after update) {

	for (Opportunity opp : Trigger.new) {

		if (opp.StageName == 'Closed Won' && opp.StageName != Trigger.oldMap.get(opp.Id).StageName) {

			SendCalendarInvite sci = new SendCalendarInvite(opp.Owner.Email, Date.today(), Date.today());
			sci.sendInvite();

		}

	}

}