public class EmailMissionSpecialist {
    
    // public method
    public void sendMail(String address, String subject, String body) {
        // create an email message object
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {address};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        //  pass this meail to the built-in sendEmail method
        //  of the messaging class
        Messaging.SendEmailResult [] results = Messaging.sendEmail(
            new Messaging.SingleEmailMessage[] {mail});
        
        inspectResults(results);
    }
    
    // helper method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult= true;
        // sendEmail returns an array of result objects
        // iterate through the list to inspect these result objects
        // in this case, the method only sends one email
        // so we should only have one result object 
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            } else {
                sendResult = false;
                System.debug('The following errors occured: ' 
                            + res.getErrors());
            }
        } 
        return sendResult;
    }

}