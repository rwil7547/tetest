trigger CheckSecretInformationOnCase on Case (after insert, before update) {

    String childCaseSubject = 'Warning: contacts notes may contain secret words';

    // step 1: create a collection containing each of our secrey keywords 
    Set<String> secretKeyWords = new Set<String>();
    SecretKeywords.add('Credit card');
    SecretKeywords.add('Social Security');
    SecretKeywords.add('SSN');
    SecretKeywords.add('Passport');    
    SecretKeywords.add('Body weight');    

    // step 3: check to see if our Case notes contain any of the secret words
    Set<Case> casesWithSecretInfo = new Set<Case>();
    List<String> allWordsFound = new List<String>();
    String wordsFound;
        for (Case c : trigger.new){
            if (!c.Subject.contains(childCaseSubject)){
                for (String keyword : secretKeyWords){
                    if (c.Description != NULL && c.Description.containsIgnoreCase(keyword)){
                        if(!casesWithSecretInfo.contains(c)){
                            casesWithSecretInfo.add(c);
                            }
                        wordsFound = wordsFound + ', ' + keyword;
                        System.debug('Case ' + c.Id + 'notes includes the keyword ' + keyword);
                        break;
                    }
                }
            }
        }
    
    // step 4: if our case's notes contain one of the keywords, create a child case on the case object
    List<Case> casesToCreate = new List<Case>();
    
        for(Case caseWithSecretInfo : casesWithSecretInfo){
            Case childCase        = new Case();
            childCase.ParentId    = caseWithSecretInfo.Id;
            childCase.Subject     = childCaseSubject;
            childCase.isescalated = true;
            childCase.Priority    = 'High';
            childCase.Description = 'At least one of the following keywords was found' + secretKeyWords;
            casesToCreate.add(childCase);
            
        }
    
    insert casesToCreate;        

}