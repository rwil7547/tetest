public class TestCallout {
    
    public static HttpResponse doTestCallout(string Endpoint){

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint(Endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        // if the response succeeds, parse the JSON response
        if (response.getStatusCode() == 200) {
            // deserialize the JSON
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
			// cast map objects into list
			List<Object> animals = (List<Object>) results.get('animals');
            System.debug('Recieved the following animals:');
            for (Object animal : animals) {
                System.debug(animal);
            }
        }
        
        return response;
    }

    public static HttpResponse doSendData(string Endpoint){

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint(Endpoint);
        request.setMethod('POST');
        // set a header (showing JSON) and body with the content
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"name":"mighty mouse"}');        
        HttpResponse response = http.send(request);
        
        // if the response succeeds, parse the JSON response
        if (response.getStatusCode() != 201) {
			System.debug('The status code returned was not expected: ' +
                        response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        } 
        
        return response;
    }

}