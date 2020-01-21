trigger callMyReturnMethod on Contact (before insert, before update) {

for (Contact c : trigger.new){

    if (c.FirstName == 'Ronan'){
    
    c.Fax = makeAContact.returnMyNumber();
    c.LastName = 'Hilary';
    
    }
}

}