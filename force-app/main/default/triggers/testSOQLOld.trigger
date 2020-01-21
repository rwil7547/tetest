trigger testSOQLOld on Opportunity (before update) {
    
    for (Opportunity opp : trigger.new) {
        if (opp.Hours_Count__c != Trigger.oldMap.get(opp.id).Hours_Count__c) {
            System.debug(opp.Hours_Count__c);
            System.debug([SELECT Hours_Count__c FROM Opportunity WHERE Id IN: Trigger.newMap.keySet()].Hours_Count__c);
        }
    }

}