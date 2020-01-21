trigger CheckSecretInformation on Contact (after insert, before update) {

    String childCaseSubject = 'Warning: contacts notes may contain secret words';

    // step 1: create a collection containing each of our secrey keywords 
    Set<String> secretKeyWords = new Set<String>();
    SecretKeywords.add('Credit card');
    SecretKeywords.add('Social Security');
    SecretKeywords.add('SSN');
    SecretKeywords.add('Passport');    
    SecretKeywords.add('Body weight');    

    // step 2: check to see if our Contact notes contain any of the secret words
    List<Contact> contactsWithSecretInfo = new List<Contact>();
        for (Contact c : trigger.new){
            for (String keyword : secretKeyWords){
                if (c.Notes__c != NULL && c.Notes__c.containsIgnoreCase(keyword)){
                    contactsWithSecretInfo.add(c);
                    System.debug('Contact ' + c.Id + 'notes includes the keyword ' + keyword);
                    break;
                }
            }
        }
    
    // step 3: if our contact's notes contain one of the keywords, create a case on the contact object
    List<Case> casesToCreate = new List<Case>();
    
        for(Contact contactWithSecretInfo : contactsWithSecretInfo){
            Case childCase        = new Case();
            childCase.ContactId   = contactWithSecretInfo.Id;
            childCase.subject     = childCaseSubject;
            childCase.isescalated = true;
            childCase.priority    = 'High';
            childCase.description = 'At least one of the following keywords was found' + secretKeyWords;
            casesToCreate.add(childCase);
            
        }
    
    insert casesToCreate;        

}