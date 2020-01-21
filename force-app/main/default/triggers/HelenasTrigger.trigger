trigger HelenasTrigger on Opportunity (before update) {
    
    for (Opportunity o : trigger.new) {
        if (o.TrackingNumber__c != null) {
            o.IsPrivate = true;
        }
    }

}