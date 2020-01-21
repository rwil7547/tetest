trigger HelloWorldTwo on Contact (before update) {
    for ( Contact MyContactList : Trigger.new){
        MyContactList.FirstName = 'Hello';
        MyContactList.LastName = 'World';
        MyContactList.Birthdate = Date.today();
        
        } 
}