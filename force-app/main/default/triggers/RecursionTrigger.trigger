trigger RecursionTrigger on Opportunity (before insert, before update) {
    
    if (CheckRecursionPrevention.firstRun){
        for (Opportunity o : trigger.new){
            o.LeadSource = 'Web';
            
            Task t = new Task();
            t.WhatId = o.id;
            t.Description = 'Recursion test';
            insert t;
        }
    
    CheckRecursionPrevention.firstRun = false;
    }
}