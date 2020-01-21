global class AddBatchOppTask implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator('SELECT Name, Id, Amount, OwnerId, CloseDate FROM Opportunity'
                                        + ' WHERE StageName != \'Closed Won\' AND CloseDate < TODAY');
    }
                                                                     
 	global void execute(Database.BatchableContext BC, List<Opportunity> openOpps){
        List<Task> followUp = new List<Task>();
        for (Opportunity o : openOpps){
            Task t = new Task();
            t.WhatId = o.Id;
            t.Subject = 'Please follow up this task ASAP';
            followUp.add(t);
        }
        
        insert followUp;
	}
    
    global void finish(Database.BatchableContext BC){
    }
}