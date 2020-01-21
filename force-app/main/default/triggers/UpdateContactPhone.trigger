trigger UpdateContactPhone on Account (before update) {

    List<Contact> contInTrigg = [SELECT Id,
                                        OtherPhone,
                                        AccountId
                                FROM    Contact
                                WHERE   Account.Id IN :trigger.new];

    Map<Id,String> idToPhone = new Map<Id,String>();

    for (Account a : trigger.new){
        Account oldAccount = trigger.OldMap.get(a.id);
        if (a.Phone != oldAccount.Phone){
            idToPhone.put(a.id,a.Phone);

        }
    }

    for (Contact c : contInTrigg){
        c.OtherPhone = idToPhone.get(c.AccountId);
    }

    update contInTrigg;

}