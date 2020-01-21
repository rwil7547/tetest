trigger OrderEventTrigger on Order_Event__e (after insert) {

    // List to hold all cases to be created.
    List<Task> tasks = new List<Task>();
    
    String name = UserInfo.getFirstName() + ' ' + UserInfo.getLastName();
    
    // Get queue Id for case owner
    User myUser = [SELECT Id FROM User WHERE Name= :name LIMIT 1];
       
    // Iterate through each notification.
    for (Order_Event__e event : Trigger.New) {
        if (event.Has_Shipped__c == true) {
            // Create Case to dispatch new team.
            Task t = new Task();
            t.Priority = 'Medium';
            t.Subject =  'Follow up on shipped order ' + event.Order_Number__c;
            t.OwnerId = myUser.Id;
            tasks.add(t);
        }
   }
    
    // Insert all cases corresponding to events received.
    insert tasks;

}