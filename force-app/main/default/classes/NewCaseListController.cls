public class NewCaseListController {
    
    private String caseStatus = 'New';
    
    public List<Case> getNewCases(){
        
        List<Case> cases = [SELECT id, CaseNumber
                            FROM Case
                            WHERE Status = 'New'];
        
        return cases;
        
    }

}