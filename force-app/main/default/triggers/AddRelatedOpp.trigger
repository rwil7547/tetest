trigger AddRelatedOpp on Account (after insert) {
    
    List<Opportunity> oppList = new List<Opportunity>();
    
    Map<Id,Account> accsWithOpps =  new Map<Id,Account>(
        [SELECT id, (SELECT Id FROM Opportunities) FROM Account WHERE Id IN :Trigger.New]);
    
    for (Account a : Trigger.new){
        System.Debug('accsWithOpps.get(a.Id).Opportunities.size() =' + accsWithOpps.get(a.Id).Opportunities.size());
        if (accsWithOpps.get(a.Id).Opportunities.size() == 0) {
            oppList.add(new Opportunity (Name=a.Name + 'Opportunity',
                                        StageName='Prospecting',
                                        CloseDate=system.today().addMonths(1),
                                        AccountId=a.id));
        }
    }

    if (oppList.size()> 0){
        insert oppList;
    }
}