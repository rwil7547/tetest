trigger AddCSR on Opportunity (before insert) {

    // retrieve the custom setting values
    CSR_Settings__c settings    = CSR_Settings__c.getInstance('csr');
    String CSR_USER_ID          = settings.CSR_User_ID__c;
    Decimal OPP_MIN_VALUE       = settings.Opp_Minumum_Value__c;

    // create master list of accounts to update
    List<Account> accounts = new List<Account>();

    for (Opportunity opp : Trigger.new) {

        // make sure the opp value is above the threshold in the custom setting
        if (opp.Amount >= OPP_MIN_VALUE && opp.AccountId != null){

            Account acc = new Account();
            acc.Id      = opp.AccountId;

            // update the CSR and add to the master list
            acc.CSR__c = CSR_USER_ID;
            accounts.add(acc);
        }
    }

    update accounts;

}