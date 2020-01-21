global class ScheduleBacthOppTask implements Schedulable {
    
    global void execute(SchedulableContext ctx){
        AddBatchOppTask add =  new AddBatchOppTask();
        Id batchid = Database.executeBatch(add);
    }
    
}