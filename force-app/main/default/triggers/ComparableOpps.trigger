trigger ComparableOpps on Opportunity (after insert) {

    for (Opportunity opp : Trigger.new){
        //conduct initial SOQL query to retriev opp account industry
        Opportunity oppWithAccountInfo = [SELECT Id, 
                                                 Account.Industry
                                            FROM Opportunity
                                            WHERE id = :opp.id
                                            LIMIT 1];
        System.debug('Opp found is: ' + oppWithAccountInfo.Id);

        // get our bind variables ready
        Decimal minAmount;  
        Decimal maxAmount;  

        if (opp.Amount != null){
            minAmount   = opp.Amount * 0.9;
            maxAmount   = opp.Amount * 1.1;         
        }  

        // search for comparable opps
        List<Opportunity> comparableOpps =  [SELECT   id
                                                FROM  Opportunity
                                                WHERE Amount >= :minAmount
                                                AND   Amount <= :maxAmount
                                                AND   Account.Industry = :oppWithAccountInfo.Account.Industry
                                                AND   StageName = 'Closed Won'
                                                AND   CloseDate >= LAST_N_DAYS:365
                                                AND   Id != :opp.Id];

        System.debug('Comparable opp(s) found: ' + comparableOpps);

        // for each comparable opp, create a Comparable__c record
        List<Comparable__c> junctionObjsToInsert    = new List<Comparable__c>();
        for (Opportunity comp : comparableOpps) {
            Comparable__c junctionObj               = new Comparable__c();
            junctionObj.Base_Opportunity__c         = opp.Id;
            junctionObj.Comparable_Opportunity__c   = comp.Id;
            junctionObjsToInsert.add(junctionObj);

        }
        insert junctionObjsToInsert;

    }

}