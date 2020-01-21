public class AnimalLocator {
    
    public static string getAnimalNameById(Integer animalId) {
      
        Map<String, Object> animal;
        
        Http http = new http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) {
            
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            animal = (Map<String, Object>) results.get('animal');
        }
        
        return(String)animal.get('name');       
    }
}