trigger ExampleTrigger on Lead (after insert, after delete) {
    
    if (Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        EmailManager.sendMail('ronanjwilliams@gmail.com', 'Hi matey', 'I was sent to you by EmailManager.sendMail() method, how cool is that!');
        } else if (Trigger.isDelete){
        
        }

}