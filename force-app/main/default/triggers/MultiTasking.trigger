trigger MultiTasking on Account (after insert) {

    //create a list of words containing all words in the picklist field
    List<String> allWords = new List<String>();
    allWords.add('Bruce');
    allWords.add('Andrew');
    allWords.add('Toby');
    allWords.add('Debbie');
    allWords.add('Marcus');

    //create a list of tasks that will need to be made for each account
    List<Task> tasksToCreate = new List<Task>();


    //loop through all records in the trigger 
    for (Account a : trigger.new){
        if (a.Picklist_Fun__c != null){
            for (String w : allWords){
                if (a.Picklist_Fun__c.contains(w)){
                    Task t      = new Task();
                    t.Subject   = 'subject is' + w;
                    t.Whatid        = a.Id;
                    tasksToCreate.add(t); 
                }
            }
        }
    }

    insert tasksToCreate;
}