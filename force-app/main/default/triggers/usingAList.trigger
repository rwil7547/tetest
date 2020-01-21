trigger usingAList on Product2 (before insert) {

    List<Account> newAccounts = new List<Account>();
    
    for (Product2 currentBatch :trigger.new){
    
        if (currentBatch.CanUseQuantitySchedule){
        
        Account inLoopAccount = new Account();
        inLoopAccount.Name    = 'Patricia';
        inLoopAccount.Type    = 'Government';
        newAccounts.add(inLoopAccount);
        }
     
     insert newAccounts;
    }

}