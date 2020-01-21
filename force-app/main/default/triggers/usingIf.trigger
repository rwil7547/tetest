trigger usingIf on Account (before update) {

List<Contact> rwil7547 = [SELECT Id FROM Contact WHERE Email='ronanjwilliams@gmail.com'];
List<Opportunity> gottaGo = [SELECT Id FROM Opportunity WHERE Name='ApplePie'];

    for(Account updatedAccount : Trigger.new){
    
    if(updatedAccount.Name == 'Romeo'){    

        updatedAccount.SLASerialNumber__c = 'et564';
    
    }

    for(Opportunity wizzAir: gottaGo){
    
    if(updatedAccount.Name == 'Romeo'){
    
    delete gottaGo;
    
    }
    }
    
    for(Contact myList : rwil7547){
    
    if(updatedAccount.Name == 'Romeo'){
    
    myList.FirstName = 'Stuart';
    
    update myList;
    
    }
    }    


}

}