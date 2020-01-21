global class AddBatchUpdate implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT LastName, Id FROM CONTACT');
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> scope){
        for (Contact c : scope){
            c.LastName = c.LastName + ' Batch updated';
        }
        
        update scope;
    }
    
    global void finish(Database.BatchableContext bc){
        
    }

}