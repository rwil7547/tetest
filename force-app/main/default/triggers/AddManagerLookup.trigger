trigger AddManagerLookup on Opportunity (after insert) {

    List<Opportunity> allOpps = [SELECT Id,
                                        Owner.ManagerId 
                                FROM    Opportunity 
                                WHERE   Id 
                                IN      :trigger.new];

    
    List<Opportunity> toUpdate = new List<Opportunity>();

    for (Opportunity o : allOpps){
        if (o.Owner.ManagerId != null){
            o.Owner_s_Manager__c = o.Owner.ManagerId;
            toUpdate.add(o);
        }
    }

    update toUpdate;

}