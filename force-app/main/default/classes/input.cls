public class input {
    public String ContactId {set; get;}
    public Contact c {set; get;}
    private List<SelectOption> contacts;
    private Map<Id,Contact> contactMap = new Map<Id,Contact>();

    public List<SelectOption> getContacts(){
       if(contacts == null){
           Contact [] cons = [select Id, Name, Title, FirstName, LastName, Phone, Email from Contact limit 10];
           contactId = cons[0].Id;
           contacts = new List<SelectOption>();
    
           for(Contact c : cons){
              contacts.add(new SelectOption(c.ID,c.Name));
              contactMap.put(c.Id,c);
           }
       }
       return contacts;
    }
   
    public PageReference updateContact(){
        c = contactMap.get(ContactID);
        return null;
    }      
}