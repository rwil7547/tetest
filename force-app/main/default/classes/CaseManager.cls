@RestResource (urlMapping='/Cases/*')
global class CaseManager {
    
    @HttpGet
    global static Case getCaseById() {
        RestRequest request = RestContext.request;
        // grab the case id from the url
        String caseId = request.requestURI.substring(
            request.requestURI.lastIndexOf('/')+1);
        Case result = [SELECT CaseNumber, OwnerId, Owner.FirstName, Subject,Status,Origin, Priority
                      FROM Case
                      WHERE Id = :caseId];
        return result;
    }
    
    @HttpPost
    Global static Id createCase(String subject, String status,
                                String origin, String priority){
        Case thisCase = new Case(
        	Subject = subject,
        	Status = status,
        	Origin = origin,
        	Priority = priority);
        insert thisCase;
        return thisCase.Id;
     }
    
    @HttpDelete
    global static void deleteCase() {
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
        	request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE id = :caseId];
        delete thisCase;
    }
    
    @HttpPut
    global static ID upsertCase(String subject, String status, 
                                String origin, String priority, String id){
        Case thisCase = new Case(
        	Id = id,
        	Subject = subject,
        	Status = status,
        	Origin = origin,
        	Priority = priority);
        // Macth case by Id, if it exists
        // Otherwise, create new case
        upsert thisCase;
        // return the case Id
        return thisCase.Id;
    }
    
    @HttpPatch
    global static Id updateCaseFields(){
        RestRequest request = RestContext.request;
        String caseId = request.requestURI.substring(
        	request.requestURI.lastIndexOf('/')+1);
        Case thisCase = [SELECT Id FROM Case WHERE Id = :caseId];
        // Deserialise JSON string into name-value pairs
        Map<String, Object> params = (Map<String, Object>)JSON.deserializeUntyped(request.requestbody.tostring());
        //iterate through each parameter field and value
        for (String fieldName : params.keySet()) {
            thisCase.put(fieldName, params.get(fieldName));
        }
        update thisCase;
        return thisCase.id;
    }

}