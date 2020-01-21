public class ContactAndLeadSearch {
    
    public static List<List<SObject>> searchContactsAndLeads(String name){
        List<List<SObject>> leadsAndContacts = [FIND :name IN NAME FIELDS RETURNING 
                                               Contact(Id,LastName WHERE LastName = :name OR FirstName = :name), 
                              				   Lead(Id,LastName WHERE LastName = :name OR FirstName = :name)];
        
        return leadsAndContacts;
    }
}