public class RandomContactFactory {
    
    public static List<Contact> generateRandomContacts(Integer numberToMake, String name){
        
        List<Contact> toGive = new List<Contact>();
        
        for(Integer i = 0; i < numberToMake; i++){
            Contact c = new Contact();
            c.LastName = name;
            c.FirstName = 'Test ' + i;
            toGive.add(c);
        }
        
        return toGive;
    }

}