public class RemindOwners {
    
    public void createTasks(List<Opportunity> notClosed){
        
        List<Task> tasksToAdd = new List<Task>();
        
        for (Opportunity o : notClosed){
            Task t =  new Task();
            t.Subject = 'Please contact the client';
            t.OwnerId = o.OwnerId;
            t.ActivityDate = Date.today();
            t.WhatId = o.Id;
            t.Priority = 'Normal';
            t.Status = 'Open';
            tasksToAdd.add(t);
        }       
        
        System.Debug('Size of list of tasks to be added is ' + tasksToAdd.size());
        
        if (tasksToAdd.size() > 0){
            insert tasksToAdd;
        }
        
    }

}