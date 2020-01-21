trigger UpdateNextStep on Opportunity (before insert, before update) {
    
    for (Opportunity opp : trigger.new){
        opp.NextStep = 'Got to hell';
    }
}