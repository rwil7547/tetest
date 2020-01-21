@isTest
public class TestAddError {

    public static testMethod void addError(){
        Opportunity opp  = new Opportunity();
        opp.Name = 'Added without enough info';
        insert opp;
        
        System.assertEquals(1, [SELECT iD FROM Opportunity].size());
    }
    
}