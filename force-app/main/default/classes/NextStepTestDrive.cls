@isTest
public class NextStepTestDrive {
    
    public static testMethod void MakeOpp(){
        Opportunity p = new Opportunity();
            insert p;
        system.AssertEquals('Go to hell',p.NextStep);
    }
}