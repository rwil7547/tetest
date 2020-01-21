public class CallSmartsheet {
    
    public static void doTestCallout(){

        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://api.smartsheet.com/2.0/sheets/4024336307775364');
		request.setHeader('Content-Type','application/json');
       	request.setHeader('Authorization','Bearer er4lmo3rmkgila2uw3k2wdvcit');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        // if the response succeeds, parse the JSON response
        if (response.getStatusCode() == 200) {
            // deserialize the JSON
		System.debug(response.getBody());
        }
    }

    /*public static HttpResponse doSendData(string Endpoint){

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
    }*/

}