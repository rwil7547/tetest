public class AccountExtension {
    
    private final Account acct;
    Opportunity opp = [SELECT Name, Amount FROM Opportunity WHERE Account.Name = 'Jackson Controls' LIMIT 1];
    
    // The extension constructor initializes the private member
    // variable acct by using the getRecord method from the standard
    // controller.
    public AccountExtension(ApexPages.StandardController stdController) {
        this.acct = (Account)stdController.getRecord();
    }

    public String getGreeting() {
        return 'Hello ' + acct.name + ' (' + acct.id + ')';
    }
    
    public String getRelatedOpp() {

        return opp.Name;
    }
    
    public Decimal getAmount(){
        
        return opp.Amount;
    }
    
    public void setAmount(){
        this.opp.Amount = 100;
        update opp;
    }
    

}