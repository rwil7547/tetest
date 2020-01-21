global class CreateOppReminders implements Schedulable {
    
    global void execute(SchedulableContext ctx){
        
        List<Opportunity> notYetClosed = [SELECT id FROM Opportunity 
                                       WHERE CloseDate < TODAY 
                                       AND StageName != 'Closed Won'];
        
        RemindOwners reminder = new RemindOwners();
        reminder.createTasks(notYetClosed);
        
    }
    
    CreateOppReminders reminder = new CreateOppReminders();
    String sch = '20 30 8 10 2 ?';
    String jobID = System.Schedule('Remind Opp Owners', sch, reminder);

}