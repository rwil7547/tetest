trigger ClosedOpportunityTrigger on Opportunity (after insert, before update) {
    
    List<Task> toadd = new List<Task>();
    
    for (Opportunity o : Trigger.new){
        if(Trigger.isInsert && o.StageName == 'Closed Won'){
            Task t = new Task(Subject = 'Follow Up Test Task', WhatId = o.Id );
            toadd.add(t);
        } else if (Trigger.isUpdate){
            if (Trigger.oldMap.get(o.Id).StageName != 'Closed Won' && o.StageName == 'Closed Won'){
                Task t = new Task(Subject = 'Follow Up Test Task', WhatId = o.Id );
                toadd.add(t);                
            }
        }
    }

    insert toadd;
    
}