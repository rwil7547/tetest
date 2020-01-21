trigger ChangeContactAccount on Contact (before insert) {

    List<Account> allAccounts = [SELECT Id, Website 
                                FROM    Account
                                WHERE   Website != null];

    for (Contact myCon : trigger.new) {
        if (myCon.Email != null){

            String domain   = myCon.Email.split('@').get(1);
            String website  = 'www.' + domain;
            System.debug('Matching ' + myCon.FirstName + ' to website ' + website);

            for (Account a : allAccounts){
                if (a.Website == website){
                    myCon.AccountId = a.Id;
                }
            }


        }

    }

}