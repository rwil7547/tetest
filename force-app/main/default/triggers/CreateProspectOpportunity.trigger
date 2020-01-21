trigger CreateProspectOpportunity on Contact (before insert) {

    List<Opportunity> otoBeAdded = new List<Opportunity>();
    List<Account> atobeAdded     = new List<Account>();
    
    for (Contact continLoop : trigger.new){
    
        if (continLoop.FirstName == 'Ronan'){
        
        //set the last name of the contact
        continLoop.LastName      = 'Peligroso';
        
        // create an opportunity
        Opportunity newOpp       = new Opportunity();
        newOpp.Amount            = 35000;
        newOpp.StageName         = 'Closed Won';
        newOpp.CloseDate         = Date.today()-30;
        newOpp.Name              = 'We Made It Baby!';
        otoBeAdded.add(newOpp);
        }

        else{
        
        //set the last name of the contact
        continLoop.Lastname      = 'Gefahrlich';
        
        // create an account instead
        Account newAcc           = new Account();
        newAcc.Name              = 'Gefahrlich Ltd.';
        newAcc.Type              = 'Charity';
        atobeAdded.add(newAcc);
        }
     
     insert otoBeAdded;
     insert atobeAdded;
     }
}