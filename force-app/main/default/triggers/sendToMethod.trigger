trigger sendToMethod on Account (before insert) {
    
    integer x = 5;
    integer y = 4;
    integer z = 3;
    
//when a new account is created, automatically create the number of new contacts specified, based on the account type
    
    for (Account a : trigger.new){
        if (a.Name == 'Homebase' && a.Type == 'Prospect'){
        makeAContact.makeContact(x);
        } else if (a.Name == 'Homebase' && a.Type == 'Customer'){
        makeAContact.makeContact(y);
        } else {
        makeAContact.makeContact(z);
        }
    }
}