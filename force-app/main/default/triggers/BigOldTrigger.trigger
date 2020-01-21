trigger BigOldTrigger on Diesel_Tank__c (before insert) {

       Diesel_Tank__c[] tanks = Trigger.new;

       DieselTankClass.doubleVolume(tanks);

}