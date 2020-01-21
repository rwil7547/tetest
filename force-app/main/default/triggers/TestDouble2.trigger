trigger TestDouble2 on Campsite__c (before update) {
    
    List<Campsite_Reservation__c> toInsert = new List<Campsite_Reservation__c>();
    
    System.Debug('before trigger execution value is ' + RepeatHelper.firstRun);

    RepeatHelper.firstRun = false;
    
    for (Campsite__c c : Trigger.new){
        Campsite__c old = Trigger.oldMap.get(c.id);
        Campsite_Reservation__c r = new Campsite_Reservation__c();
        r.Campsite__c = c.id;
        toInsert.add(r);

    }

   System.Debug('after trigger execution value is ' + RepeatHelper.firstRun);
    
    insert toInsert;

}