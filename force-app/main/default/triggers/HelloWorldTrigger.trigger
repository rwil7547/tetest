trigger HelloWorldTrigger on Book__c (before insert) {

    for (Book__c b : Trigger.new) {
    
    b.Name = 'Hello World';
}
}