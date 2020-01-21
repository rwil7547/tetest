public class RidiculousController {
   
   private final Opportunity opportunity;    
    
   public RidiculousController(){
        opportunity = [SELECT Id FROM Opportunity 
                      WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
   }
    
   public Opportunity getOpportunity(){
       return opportunity;
   }
   
    public PageReference save(){
        update opportunity;
        return null;
    }

}