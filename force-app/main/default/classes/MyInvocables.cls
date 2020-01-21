public class MyInvocables {
    
    @InvocableMethod (label='edit field' description='edit the field')
    public static void editField(List<Id> campsites){
        List<Campsite__c> calledUp = [SELECT Id FROM Campsite__c WHERE Id IN :campsites];
        for (Campsite__c c : calledUp){
            if (Schema.SObjectType.Campsite__c.fields.TestFieldOne__c.isAccessible()){
                c.TestFieldOne__c = 'Updated by invocable apex';
                update c;  
            }
                  
        }

    }

}