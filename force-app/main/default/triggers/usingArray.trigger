trigger usingArray on Account (before insert) {

    integer x = 0;

    for (Account inLoop : trigger.new){
    
    Contact[] newContact   = new Contact[5];
    
    while (x<5){
        newContact[x]      = new Contact();
        newContact[x].Title    = 'Homebase';
        x = x+1;
        }
      
    newContact[0].LastName = 'Billy';
    newContact[1].LastName = 'Jane';
    newContact[2].LastName = 'John';
    newContact[3].LastName = 'Mike';
    newContact[4].LastName = newContact[0].LastName;
    
    insert newContact;
    }
}