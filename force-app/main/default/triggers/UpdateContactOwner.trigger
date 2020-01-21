trigger UpdateContactOwner on Contact (before insert) {

    for (Contact myCon : Trigger.new){
        if (myCon.AccountId != null){
            List<Account> accs = [SELECT Id,
                                        OwnerId
                                    FROM Account
                                    WHERE Id = :myCon.AccountId];
            myCon.OwnerId = accs.get(0).OwnerId;
        }
    }

}