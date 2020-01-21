trigger UsePickListCounter on Account (before insert, before update) {

    List<String> wordsSelected = new List<String>();
    wordsSelected.add('Toby');
    wordsSelected.add('Marcus');
    wordsSelected.add('Bruce');
    wordsSelected.add('Andrew');
    wordsSelected.add('Debbie');


    for (Account a : trigger.new){
        Integer numberSelected = 0;
        if(a.Picklist_Fun__c != null){
            for (String givenWord : wordsSelected){
                if(a.Picklist_Fun__c.contains(givenWord)){
                    numberSelected = numberSelected + 1;
                }
            }
            a.Counter__c = numberSelected;
            a.Name      = 'Robbie';
        }

    }

}