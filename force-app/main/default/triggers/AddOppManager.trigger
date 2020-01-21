trigger AddOppManager on Opportunity (after insert, before update) {

    List<OpportunityTeamMember> toInsert = new List<OpportunityTeamMember>();

    for (Opportunity o : trigger.new){

        User oOwner =  [SELECT id,ManagerId FROM User WHERE id = :o.OwnerId];

        if (oOwner.ManagerId != null){
            OpportunityTeamMember toadd     =  new OpportunityTeamMember();
            toadd.OpportunityId             = o.Id;
            toadd.UserId                    = oOwner.ManagerId;
            toadd.TeamMemberRole            = 'Sales Manager';
            toadd.OpportunityAccessLevel    = 'Edit';
            toInsert.add(toadd);
        }

    }

    insert toInsert;

}