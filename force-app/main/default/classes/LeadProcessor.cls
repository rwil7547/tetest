global class LeadProcessor implements 
	Database.Batchable<sObject>, Database.Stateful{
        
        global Database.QueryLocator start(Database.BatchableContext bc) {
            return Database.getQueryLocator(
                'SELECT id FROM Contact'
            );
        }
        
        global void execute(Database.BatchableContext bc, List<Contact> scope){
            List<Contact> toUpdate = new List<Contact>();
            
            for (Contact con : scope){
                con.LeadSource = 'Dreamforce';
                toUpdate.add(con);
            }
            
            update toUpdate;
        }
        
        global void finish (Database.BatchableContext bc){
            
        }
}