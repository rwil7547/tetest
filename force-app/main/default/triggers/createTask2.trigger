trigger createTask2 on Opportunity (before insert, before update) {
    List<Task> autoTask = new List<Task>();
    
    for (Opportunity o : trigger.new){
    
        if (o.StageName == 'Closed Won'){
        
        Task newTask = new Task();
        newTask.Subject = 'Get on with it';
        newTask.WhatId = o.Id;
        newTask.ActivityDate = o.CloseDate;
        autoTask.add(newTask);
        }
    
    insert autoTask;
    }     

}