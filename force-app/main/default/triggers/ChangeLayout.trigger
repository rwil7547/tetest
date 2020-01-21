trigger ChangeLayout on Opportunity (before update) {
    
    for (Opportunity o : trigger.new) {
        if (Trigger.oldMap.get(o.id).StageName == 'Prospecting' &&
            o.StageName == 'Closed Won' ) {
                o.RecordTypeId = '01258000000FKht';
            }
    }

}