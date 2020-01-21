trigger GoodyeEmail on Lead (before update) {
    LeadGoodbye__c settings = LeadGoodbye__c.getInstance('Summer17');
    Boolean active = settings.SendEmails__c;
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    System.Debug('Haloooo');
    
    if (active){
        for (Lead l : trigger.new){
            Lead oldLead = trigger.oldMap.get(l.id);
            System.Debug(oldLead.Status);
            if (oldLead.Status != 'Cold' && l.Status == 'Cold'){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                string[] to = new string[]{};
                to.add(l.Email);
                mail.setToAddresses(to);
                mail.setSenderDisplayName('Ronan\'s Dev Org');
                mail.setSubject('Goodbye ' + l.FirstName + ', you will be missed!');
                mail.setplaintextBody('It\'s honestly really sad to see you go... ');
                mails.add(mail);             
            }
        }
    }
    
    if (mails.size()>0){
        Messaging.sendEmail(mails);
    }
}