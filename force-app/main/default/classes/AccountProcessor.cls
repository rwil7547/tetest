public class AccountProcessor {
    
    @future
    public static void countContacts (List<Id> accIds) {
        
        System.Debug('The future method has at least been called');
        
        List<Account> toUpdate =  new List<Account>();
        
        for (integer x = 0; x < accIds.size(); x++){
            List<Contact> conts = [SELECT Id FROM Contact
                                  WHERE AccountId = :accIds[x]];
            Account acc = new Account();
            acc.Id = accIds[x];
            acc.Number_of_Contacts__c = conts.size();
            toUpdate.add(acc);
        }
        
        System.Debug('Number of accounts called in future method is ' + toUpdate.size());
        update toUpdate;
                   
    }

}