@isTest

Private Class caseTest{

    Static testMethod void myTestContact(){
    
    Case myTest = new Case();
    
    myTest.Origin                         = 'Phone';
    myTest.Product_Purchase_Date__c       = Date.today();
    myTest.Product_Total_Warranty_Days__c = 9;
    
    
    insert myTest;
    
    }
}