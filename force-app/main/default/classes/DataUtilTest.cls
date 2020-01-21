@isTest
private class DataUtilTest {
    static testMethod void testLoadData() {
        
        List<sObject> ls = Test.loadData(Account.sObjectType, 'TestAccount');
        
        System.assertEquals(1,ls.size());
        
        Account a1 = (Account)ls[0];
        String acctName  = a1.Name;
        System.Debug(acctName);
    }

}