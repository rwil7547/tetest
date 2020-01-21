trigger MapOnOpportunity on Opportunity (after insert) {

    Set<String> allEmails = new Set<String>();

    List<Opportunity> myList = [SELECT Id, Description, Project_Manager__c 
                                FROM Opportunity 
                                WHERE Id IN :trigger.new];

    for (Opportunity opp : myList){
        if (opp.Description != null){
            allEmails.add(opp.Description);
        }
    }

    List<User> possibleUser = [SELECT Id, Email FROM User WHERE Email IN :allEmails];

    Map<String,String> email2User = new Map<String,String>();

    for (User u : possibleUser){
        email2User.put(u.Email,u.Id);
    }

    List<Opportunity> toUpdate = new List<Opportunity>();

    for (Opportunity opp : myList){
        if (opp.Description != null){
            String ownsIt = email2User.get(opp.Description);
            opp.Project_Manager__c  = ownsIt;
            toUpdate.add(opp);
        }
    }

    update toUpdate;

}