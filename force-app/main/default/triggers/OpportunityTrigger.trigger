trigger OpportunityTrigger on Opportunity (
        before insert, after insert,
        before update, after update,
        before delete, after delete) {

    if (Trigger.isbefore){
        if (Trigger.isInsert){

        }
        if (Trigger.isUpdate){
            WinningOpportunityChecker checker = 
            new WinningOpportunityChecker(Trigger.oldMap,Trigger.newMap);
            checker.checkWinningOpps(); 

        }
        if (Trigger.isDelete){

        }
    }

    if (Trigger.isAfter){
        if (Trigger.isInsert){

        }
        if (Trigger.isUpdate){

        }
        if (Trigger.isDelete){

        }
    }

}