trigger findDupes on Lead (before insert, before update) {

    // run a SOQL query to check if the email of the new lead matches an existing contact    
    for (Lead myLead : trigger.new){
        if (myLead.Email != null){
            List<Contact> dupes = [SELECT Id FROM Contact 
                                            WHERE Email= :myLead.Email];
            if(dupes.size()> 0){
                myLead.Dupe_Contact__c = dupes[0].Id;
                }
               
                else {
                    myLead.Dupe_Contact__c = null;
                }
           }
           
      }
                                             
}