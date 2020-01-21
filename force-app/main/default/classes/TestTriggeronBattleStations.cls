@isTest
public class TestTriggeronBattleStations {
    static testMethod void BattleStationCreator () {
        Battle_Station__c BS = new Battle_Station__c();
        BS.Name              = 'Test Battle Station';
        insert BS;
        }
}