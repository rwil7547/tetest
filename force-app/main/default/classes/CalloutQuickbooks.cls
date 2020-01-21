public class CalloutQuickbooks {
    
    public static void getQuickBooksContacts() {
        
        Http http = new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:SanboxTest2/query?query=select%20%2A%20from%20budget&minorversion=4');
        request.setHeader('Accept', 'application/json');
        request.setMethod('GET');        
        
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {

            List<BugdetDetail__c> budgetDetails = new List<BugdetDetail__c>();
            
            JSON2ApexQuickbooksWrapper.JSON2ApexQuickbooks parsedResults = JSON2ApexQuickbooksWrapper.parse(response.getBody());

            for (JSON2ApexQuickbooksWrapper.Budget budget : parsedResults.QueryResponse.Budget) {
                for (JSON2ApexQuickbooksWrapper.BudgetDetail detail : budget.BudgetDetail) {
                    BugdetDetail__c bd      = new BugdetDetail__c();
                    bd.AccountRefName__c    = detail.AccountRef.name;
                    bd.Amount__c            = (Decimal)detail.Amount;
                    bd.Date__c              = Date.valueOf(detail.BudgetDate);
                    bd.Year__c              = budget.Name;
                    bd.Value__c             = detail.AccountRef.Value;
                    bd.ExternalId__c        = 'ID' + (budget.Name.deleteWhitespace().remove('/').remove('﻿"') + 
                                              detail.AccountRef.name.deleteWhitespace().remove('﻿"') + 
                                              detail.BudgetDate.deleteWhitespace().remove('-').remove('﻿"'));
                    budgetDetails.add(bd);
                }
            }

            upsert budgetDetails ExternalId__c;
        } 
    }  
}