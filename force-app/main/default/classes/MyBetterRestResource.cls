@RestResource(urlMapping='/Opportunity/*')
global with sharing class MyBetterRestResource {
    
    @HttpDelete
    global static void doDelete() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String opportunityId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Opportunity opp = [SELECT id FROM Opportunity WHERE Id = :opportunityId];
        delete opp;
    }
    
    @HttpGet
    global static Opportunity doGet(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String opportunityId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Opportunity resultOpp = [SELECT Id FROM Opportunity WHERE Id = :opportunityId];
        return resultOpp;
    }
    
    @HttpPost
    global static String doPost(String name, Integer amount, 
                                Date closeDate, String stageName){
        Opportunity oppNew = new Opportunity();
        oppNew.Name = name;
        oppNew.Amount = amount;
        oppNew.CloseDate = closeDate;
        oppNew.StageName = stageName;
        insert oppNew;
        return oppNew.id;
    }

}