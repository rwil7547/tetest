trigger MaximumCasesTwo on Case (before insert) {
   
    // retrieve the custom setting limit for cases created
    MaximumCasesTwo__c settings = MaximumCasesTwo__c.getInstance('max');
    Integer maxCases = Integer.valueOf(settings.MaximumCases__c);
    System.debug('Value in the system is ' + maxCases);
    
    
    // create a set of all record creator ids in the trigger
    Set<Id> allIds = new Set<Id>();
    
    for (Case c : trigger.new){
        allIds.add(c.CreatedById);
    }
    
    // create a map of these ids with the number of cases created in the last month
    Map<Id,AggregateResult> results = 
        new Map<id,AggregateResult>([SELECT CreatedbyId Id, COUNT(Id) CaseId 
                                       FROM Case 
                                       WHERE CreatedbyId IN : allIds 
                                       GROUP BY CreatedbyId]);
    

    

}