trigger TestSOQLAccess on Opportunity (before insert) {
    
    List<Opportunity> opps = [SELECT Id FROM Opportunity];
    
    for (Opportunity o : trigger.new){
        if(opps.size() > 0){
            o.addError('Sorry, cant insert');
        }
    }

}