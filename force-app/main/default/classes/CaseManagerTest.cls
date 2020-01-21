@isTest
private class CaseManagerTest {
    
    // Helper method
    static Id createTestRecord() {
        // Create test record
        Case caseTest = new Case(
            Subject='Test record',
            Status='New',
            Origin='Phone',
            Priority='Medium');
        insert caseTest;
        return caseTest.Id;
    }  
    
    @isTest private static void testgetCaseById(){
        Id recordId = createTestRecord();
        // set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 'https://eu6.salesforce.com/service/apexrest/Cases/'
            + recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        // call the method to test
        Case thisCase = CaseManager.getCaseById();
        // verify results
        System.assert(thisCase != null);
        System.assertEquals('Test record', thisCase.Subject);
        
    }
    
    @isTest static void testCreateCase() {
        // call the method to test
        Id thisCaseId = CaseManager.createCase(
        	'Ferocious chipmunk', 'New', 'Phone', 'Low');
        // verify that the case was created by the method
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Subject 
                        FROM Case
                        WHERE Id = :thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals(thisCase.subject, 'Ferocious chipmunk');
    }
    
    @isTest static void testDeleteCase() {
        Id recordId = createTestRecord();
        // set up a test request
        RestRequest request = new RestRequest();
        request.requestURI = 
            'https://eu6.salesforce.com/service/apexrest/Cases/' + recordId;
        request.httpMethod = 'DELETE';
        RestContext.request = request;
        // call the method  to test
        CaseManager.deleteCase();
        // verify record is deleted
        List<Case> cases = [SELECT Id 
                            FROM Case
                           WHERE Id = :recordId];
        System.assert(cases.size()==0);      
    }
    
    @isTest static void testUpsertCase() {
        // 1. insert new record
        Id caseOneId = CaseManager.upsertCase(
        	'Ferocious chimpmunk', 'New', 'Phone', 'Low', null);
        // verify that the case was inserted
        System.assert(CaseOneId != null);
        Case caseOne = [SELECT Id, Subject FROM Case WHERE Id = :caseOneId];
        System.assert(caseOne != null);
        System.assertEquals('Ferocious chimpmunk', caseOne.subject);
        // 2. update existing record to working
        Id caseTwoId = CaseManager.upsertCase(
        	'Ferocious chipmunk', 'Working', 'Phone', 'Low', caseOneId);
        // verify case was updated
        System.assertEquals(caseOneId, caseTwoId);
        Case caseTwo = [SELECT Id, Status 
                       FROM Case
                       WHERE Id = :caseTwoId];
        System.assert(caseTwo != null);
        System.assertEquals('Working', caseTwo.status);
    }
    
    @isTest static void testUpdateCaseFields() {
        Id recordId = createTestRecord();
        RestRequest request = new RestRequest();
        request.requestURI = 
            'https://eu6.salesforce.com/services/apexrest/Cases/' 
            + recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"status": "Working"}');
        RestContext.request = request;
        // update status of existing record to working
        Id thisCaseId = CaseManager.updateCaseFields();
        // verify record was updated
        System.assert(thisCaseId != null);
        Case thisCase = [SELECT Id, Status
                        FROM Case
                        WHERE Id = :thisCaseId];
        System.assert(thisCase != null);
        System.assertEquals('Working', thisCase.status);
            
    }

}