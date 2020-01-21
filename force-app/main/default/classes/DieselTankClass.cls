public class DieselTankClass {

public static void doubleVolume(Diesel_Tank__c[] tanks) {
   for (Diesel_Tank__c t :tanks){
      t.Name = 'Name changed by doubleVolume method';
      t.Container_Volume__c *= 2;
      t.Manufacturer_Name__c = 'BMW';
   }
}

public static void destroyBattleStations(Battle_Station__c[] stations) {
    for (Battle_Station__c b :stations) {
      b.Project_Status__c = 'Green';
      b.Gasket_Blown__c = TRUE;
   }

}

}