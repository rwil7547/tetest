public class BudgetEntry {
    
    public string year {get;set;}
	
    List<Budget_Entry__c> bes {get; set;}
	
    public List<Budget_Entry__c> getBes() {
        return bes;
    }

    public pageReference doUpdate() {
        update bes;
		updateList();        
		PageReference pr = ApexPages.currentPage();
        return pr;
    }
    
    public pageReference changeYear() {
        return null;
    }
     
    public List<Schema.PicklistEntry> getYears() {
        List<String> years = new List<String>();
        Schema.DescribeFieldResult fieldResult = Budget_Entry__c.Financial_Year__c.getDescribe();
		List<Schema.PicklistEntry> yearsLabels = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry pe : yearsLabels) {
            years.add(pe.Label);
        }
        
        return yearsLabels;
    }
    
    
Schema.DescribeFieldResult fieldResult = Budget_Entry__c.Financial_Year__c.getDescribe();
List<Schema.PicklistEntry> years = fieldResult.getPicklistValues();    

    public void updateList() {
        year = 'FY 18/19';
        bes = [SELECT Id, Category__c, Financial_Year__c, 
               April__c, May__c, June__c, July__c, August__c, 
               September__c, October__c, November__c, December__c, 
               January__c, February__c, March__c, Total__c
               FROM Budget_Entry__c
               WHERE Financial_Year__c = :year];        
    }    
    
    
    public BudgetEntry(){
        bes = [SELECT Id, Category__c, Financial_Year__c, 
               April__c, May__c, June__c, July__c, August__c, 
               September__c, October__c, November__c, December__c, 
               January__c, February__c, March__c, Total__c
               FROM Budget_Entry__c
               WHERE Financial_Year__c = 'FY 18/19'];
    }

}