trigger AccountAddressTrigger on Account (before insert, before update) {
    
    for (Account a : Trigger.new){
        if (a.BillingPostalCode != null && a.BillingPostalCode != a.ShippingPostalCode && a.Match_Billing_Address__c == True){
            a.ShippingPostalCode = a.BillingPostalCode;
        }   
    }
}