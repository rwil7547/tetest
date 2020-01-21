trigger SetupStatusAfterWin on Opportunity (after insert, after update) {

    List<Contact> ContactsListOriginal = new List<Contact>();
    List<Account> AccountsListOriginal = new List<Account>();
    
    for (Opportunity JellyBean : Trigger.new)
    {
    
    string contactId = JellyBean.Primary_Contact__c;
    
    Contact contactToUpdate = [SELECT Id, FirstName, LastName
                                FROM Contact
                                WHERE Id = :contactId];
    
   }

}