trigger WarrantySummary on Case (before insert) {

    //example of locating a variable outside of a loop which is accessed in the loop
    String endingSentence = 'Have a nice day!';

    for(Case myCase : trigger.new){
    
        //set up variables to use in the summary field
        String purchaseDate           = myCase.Product_Purchase_Date__c.format();
        String createdDate            = DateTime.now().format();
        Integer warrantyDays          = myCase.Product_Total_Warranty_Days__c.intvalue();
        Decimal warrantyPercentage    = ((myCase.Product_Purchase_Date__c.daysBetween(Date.today()) 
                                        / myCase.Product_Total_Warranty_Days__c) *100).setscale(2);
        Boolean hasExtendedWarranty   = myCase.Product_Has_Extended_Warranty__c;
        
        //populate summary field 
        myCase.Warranty_Summary__c    = 'Product puchased on ' + purchaseDate + ' ' 
                                        + 'and created on ' + createdDate + '.\n' + ' '
                                        + 'Warranty is for ' + warrantyDays + ' days '
                                        + 'and is ' + warrantyPercentage + '% through its warranty period.\n'
                                        + 'Extended warranty: ' + hasExtendedWarranty + '\n'
                                        + endingSentence ;
                                        
                                         
    }
}