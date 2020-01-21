trigger ShareTerr on Account (before insert) {

    // first thing is to create a set of all zip codes to evaluate
    Set<String> zips = new Set<String>();

    if (Trigger.isinsert){
        // for any inserted account, we want to get the Zip code
        for (Account a : trigger.new){
            zips.add(a.BillingPostalCode);
        }
    } else if (Trigger.IsUpdate){
        // for updated accounts, only evaluate the record if the zip has changed
        Set<Id> changedAccs = new Set<Id>();
        for (Account a : trigger.new){
            String oldZip = Trigger.oldMap.get(a.Id).BillingPostalCode;
            String newZip = a.BillingPostalCode;
            if (newZip != oldZip){
                zips.add(newZip);
                changedAccs.add(a.Id);
            }
        } 

    // the next step involved DELETING the old sharing records from accounts that were changed
    List<AccountShare> shares = [SELECT Id FROM AccountShare
                                    WHERE AccountId IN :changedAccs
                                    AND RowCause = 'Manual'];
    delete shares;  

    }






}