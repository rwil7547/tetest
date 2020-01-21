trigger DedupeLead on Lead (before insert) {

    // assign to the queue 
    List<Group> dataQualityGroups = [SELECT id
                                    FROM Group
                                    WHERE DeveloperName = 'Data_Quality'
                                    LIMIT 1];

    for (Lead myLead : Trigger.new){
        if (myLead.Email != null) {
            
            // prepare the bind variables for the SOQL query
            String firstNameMatch;
            if (myLead.FirstName != null){
                firstNameMatch = myLead.FirstName.subString(0,1) + '%';
            }
            String companyMatch = '%' + myLead.Company + '%';

            // search for matching contacts
            List<Contact> matchingContacts = [SELECT id, 
                                                     FirstName, 
                                                     LastName, 
                                                     Account.Name
                                                FROM Contact
                                                WHERE(Email != null AND Email = :myLead.Email)
                                                OR   (FirstName != null AND FirstName LIKE :firstNameMatch
                                                AND   LastName = :myLead.LastName
                                                AND   Account.Name LIKE :companyMatch)];
            System.debug(matchingContacts.size() + ' contacts found.');

            if (!matchingContacts.isEmpty()){
                
                // if match found assign the lead to the data quality queue
                if(!dataQualityGroups.isEmpty()){
                    myLead.OwnerId = dataQualityGroups.get(0).id;               
                }

                // add the dupe's id and other info to the lead descripiton 
                String dupeContactsMessage = 'Duplicate contact(s) found:\n';
                for (Contact matchingContact : matchingContacts) {
                    dupeContactsMessage += matchingContact.FirstName + ' '
                                        + matchingContact.LastName + ', '
                                        + matchingContact.Account.Name + ' ('
                                        + matchingContact.Id + ')\n';
                }

                if (myLead.Description != null){
                    dupeContactsMessage += '\n' + myLead.Description;
                }

                myLead.Description = dupeContactsMessage + '\n' + myLead.Description;
        }

        } 

    }
}