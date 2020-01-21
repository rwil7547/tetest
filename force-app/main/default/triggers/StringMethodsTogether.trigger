trigger StringMethodsTogether on Opportunity (before insert) {
    for (Opportunity o : trigger.new){
    if( o.LeadSource == 'Phone Inquiry'){
    DateTime bestTime = DateTime.now();
    o.dfhhs__c = bestTime.addHours(4).date().addDays(2).year().format();
    }
   }
}