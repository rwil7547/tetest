public class AddPrimaryContact  implements Queueable {
    
    private Contact con;
    private String state;
    
    public AddPrimaryContact(Contact con, String state){
        this.con = con;
        this.state = state;
    }
    
    public void execute(QueueableContext context){
        List<Account> accounts = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> newContacts =  new List<Contact>();
        
        for (Account acc : accounts){
            Contact newContact = con.clone();
            newContact.AccountId = acc.Id;
            newContacts.add(newContact);
        }
        
        insert newContacts;
    }

}