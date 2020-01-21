trigger useSOQLagain on Opportunity (before insert) {

    for(Opportunity uSa : trigger.new){
         
    String plainText 		= 'woop-woop!';
    Integer numberOfpoos 	= 6;
    Decimal numberOfdecs 	= 0.15;
   
    if(uSa.Discount_Percent__c != null)
   
    uSa.I_am_required__c	= plainText;
    usa.height__c        	= numberOfpoos;
    uSa.Discount_Percent__c = numberOfpoos + numberOfpoos;
    } 

}