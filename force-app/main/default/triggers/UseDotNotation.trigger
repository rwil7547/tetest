trigger UseDotNotation on Opportunity (before insert, before update) {
 
    List<Account> accs =  new List<Account>();

    for (Opportunity opp : Trigger.new){
        if(opp.Name != null && opp.AccountId != null){
            Account a           = new Account(id = opp.Accountid);
            a.AccountNumber     = opp.Name;
            accs.add(a);
        }
    }

    update accs;

}