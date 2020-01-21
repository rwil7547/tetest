trigger SendtoDavid on Contact (before insert) {
     for (Contact StD : trigger.new) {
     StD.AccountID = '0015800000ohh0H';
     
     }
     
     for (Account accountToUpdate : [SELECT Name FROM Account WHERE AccountNumber = '12345']){
     accountToUpdate.AnnualRevenue = 22;
     update accountToUpdate;
     }
     }