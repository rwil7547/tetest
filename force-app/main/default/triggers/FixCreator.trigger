trigger FixCreator on Case (before insert) {
    for(Case newCase : trigger.new){
    
    if(newCase.SuppliedEmail != null){
    
        User trueCreator = [SELECT Id FROM User
                            WHERE Email = :newCase.SuppliedEmail
                            ORDER BY LastLoginDate DESC
                            LIMIT 1];
        newCase.CreatedById = trueCreator.Id;

        Account a = new Account(Name = 'House');
        insert a;
        }
        
    }

}