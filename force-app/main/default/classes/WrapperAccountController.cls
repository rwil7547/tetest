public class WrapperAccountController {
    
    // our collection of the class/wrapper wAccount
    public List<wAccount> accountList {get; set;}
    
    // this method uses simple SOQL query to return list of accounts
    public List<wAccount> getAccounts() {
        if (accountList == null) {
            accountList = new List<wAccount>();
            for (Account a : [SELECT Id, Name, Industry, Website FROM Account LIMIT 10]) {
                // as each account is processed add new aAccount to the list
                accountList.add(new wAccount(a));
            }
        }
        return accountList;
    }
    
    public PageReference processSelected() {
        
        // create a new list of accounts to be populated with selected accounts
        List<Account> selectedAccounts = new List<Account>();
        
        // we cycle through wAccounts and check if the selected properly is set to true,
        // if it is we add the contact to the selected contacts list
        for (wAccount wacc : getAccounts()){
            if (wacc.selected == true) {
                selectedAccounts.add(wacc.acc);
            }
        }
        
        // here's where the actual record processing takes place
        System.debug('these are the selected accounts ...');
        for (Account acc : selectedAccounts) {
            System.debug(acc);
        }
        
        accountList =  null;
        return null;
        
    }
    
    // this below is the wrapper class
    public class wAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
        
        // and here's the constructor for the wrapper class
        public wAccount(Account a) {
            acc = a;
            selected = false;
        } 
        
    }

}