trigger CaseTrigger on Case (before insert, before update, 
                             before delete, after insert,
                             after update, after delete) {
    
     if (Trigger.isBefore){
         
         if (Trigger.isInsert){
             
             CaseHandler.updateOwner(Trigger.new);
             
         }
     }

}