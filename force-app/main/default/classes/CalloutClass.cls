public class CalloutClass {
    @future(callout=true)
    public static void makeCallout(){
        HttpRequest request = new HttpRequest();
        // set URL endpoint
        String endpoint = 'http://www.google.com';
        request.setEndpoint(endpoint);
        
        request.setMethod('GET');
        
        HttpResponse response = new HTTP().send(request);
    }
}