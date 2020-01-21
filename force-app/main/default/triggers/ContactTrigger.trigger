trigger ContactTrigger on Contact (before insert) {

    Account acc = [SELECT Id FROM Account LIMIT 1];
    
    for (Contact con : Trigger.new) {
        con.AccountId = acc.Id;
    }
    
}