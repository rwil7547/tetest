trigger HelloWorldTrigger444 on Book__c (before insert) {

   Book__c[] mybooklistname = Trigger.new;

   MyHelloWorld333.applyDiscount(mybooklistname);
}