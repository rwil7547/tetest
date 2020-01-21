trigger usingLists on Opportunity (before insert, before update) {

    List<Contact> myContactList = [SELECT FirstName, Email FROM Contact
                                    WHERE Email = 'ronanjwilliams@gmail.com'
                                    ORDER BY Email];
                                    
    for (Opportunity newOpps : Trigger.new ){
    
    newOpps.Name = 'Leaflet';
    
    }
    
    for (Contact newContact : myContactList){
    
    newContact.FirstName = 'Ronan';
    
    update newContact;
    
    }
    
    
}