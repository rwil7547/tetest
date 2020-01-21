public class OldSchoolController {
    
    public List<Account> accounts {get; set;}
    public transient String myName {get;set;}
    
    public OldSchoolController (){
        
        myName = 'Ronan ' + DateTime.now();
        
        accounts = [SELECT Id, Name FROM Account LIMIT 100];
        
        
        for (account acc : accounts){
            
            acc.Name += ' ' + String.valueOf(DateTime.now());
            
        }
        
        DateTime futureDate = DateTime.now().addSeconds(10);
        
        //while (DateTime.now() < futureDate){
            
            
        //}
		        
        
    }
    

}