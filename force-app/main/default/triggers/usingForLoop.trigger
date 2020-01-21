trigger usingForLoop on Account (before insert) {


    for(Integer i = 0; i<5; i++){
    
    Contact friend = new Contact();
    friend.FirstName = 'Ronan';
    friend.LastName = 'Williams #' +i;
    friend.Birthdate = Date.today();
    
    insert friend;
    }

}