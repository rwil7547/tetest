trigger UpdateOpportunityOwner on Opportunity (before insert) {

    Set<String> allEmails = new Set<String>();
    for (Opportunity o : trigger.new){
        if (o.Owner_Email__c != null){
            allEmails.add(o.Owner_Email__c);
        }
    }

    List<User> potentialOwners = [SELECT Id,Email 
                                    FROM User
                                    WHERE Email IN :allEmails];

    Map<String,User> emailtoUser = new Map<String,User>();
    for (User u : potentialOwners){
        emailtoUser.put(u.Email,u);
    }

    for (Opportunity o : Trigger.new){
        if (o.Owner_Email__c != null) {
            User rightfulOwner = emailtoUser.get(o.Owner_Email__c);
            o.OwnerId = rightfulOwner.id;
        }
    }

}