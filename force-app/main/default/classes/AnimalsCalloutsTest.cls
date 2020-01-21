@isTest
private class AnimalsCalloutsTest {
    
    @isTest static void testGetCallout() {
        // create mock response using static resource
        StaticResourceCalloutMock mock = new StaticResourceCalloutMock();
        mock.setStaticResource('GetAnimalResource');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // associate the callout with a mock resposne
        Test.setMock(HttpCalloutMock.class, mock);
        // call method to test
        HttpResponse result = TestCallout.doTestCallout('https://th-apex-http-callout.herokuapp.com/animals');
        // verify mock response isn't null
        System.assertNotEquals(null, result.getStatusCode(), 
                              'callout returned no resposne');
        // verify code is 200
        System.assertEquals(200, result.getStatusCode());
        // verify content type
        System.assertEquals('application/json;charset=UTF-8',
                           result.getHeader('Content-Type'));
        // verify the array contains 3 items
        Map<String, Object> results = (Map<String,Object>)
            JSON.deserializeUntyped(result.getBody());
        List<Object> animals = (List<Object>) results.get('animals');
        System.assertEquals(3, animals.size());

        
    }

}