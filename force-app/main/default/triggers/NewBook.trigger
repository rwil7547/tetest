trigger NewBook on Battle_Station__c (after insert) {
    for (Battle_Station__c NB : Trigger.new) {
        Book__c CreateNewBook     = new Book__c();
        CreateNewBook.Name        = 'New Book For You Buddy';
        CreateNewBook.Apex_Update__c = 'I have been updated';
        CreateNewBook.Price__c    = 22.00;
        insert CreateNewBook;
    }
   

}