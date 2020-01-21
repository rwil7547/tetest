@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    
    // implements the interface method
    global HttpResponse respond(HttpRequest request) {
        //fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"animal":{"id":2,"name":"bear","eats":"chicken food","says":"cluck cluck"}}');
        response.setStatusCode(200);
        return response;
    }

}