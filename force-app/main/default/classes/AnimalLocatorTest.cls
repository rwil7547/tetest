@isTest
public class AnimalLocatorTest {
    
    @isTest static void testCalloutMock() {
        test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        
        String response = AnimalLocator.getAnimalNameById(2);
        
        System.assertEquals('bear', response);
    }

}