trigger SendEmail on Account (before insert) {


    // list which holds the emails we want to send to
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage> ();


    for (Account acc : trigger.new){
        if (acc.Name == 'Polity' && !String.IsBlank(acc.Email__c)){

            // create new email
            Messaging.SingleEmailMessage myEmail = new Messaging.SingleEmailMessage();

            // create a list of people who should get the email
            List<String> sendTo = new List<String>();
            sendTo.add(acc.Email__c);
            myEmail.setToAddresses(sendTo);

            // set who the email is sent from
            myEmail.setReplyTo('toby.lewis@livegroup.co.uk');
            myEmail.setSenderDisplayName('Toby Lewis');

            // set list of people to cc
            sendTo.add('ronanjwilliams@gmail.com');

            // set up the contents of the email
            myEmail.setSubject('Welcome to Live Group');
            String body =  'Dear ' + UserInfo.getFirstName() + ',';
            body += 'Welcome to our lovely company.';
            body += 'Yours, Toby';
            myEmail.setHtmlBody(body);

            mails.add(myEmail);

        }

        //send all emails in the master list
        Messaging.SendEmail(mails);
    }

}