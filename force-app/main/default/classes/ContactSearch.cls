public class ContactSearch {

    public static List<Contact> searchForContacts(String lastName, String postCode){
        String one = lastName;
        String two = postCode;
        List<Contact> matchingContacts = [SELECT Id, FirstName, LastName FROM Contact 
                                          WHERE LastName = :one AND MailingPostalCode = :two];
        
        return matchingContacts;
    }
    
}