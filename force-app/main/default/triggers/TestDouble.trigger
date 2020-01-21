trigger TestDouble on Opportunity (before update) {
    
    for (Opportunity o : Trigger.new){
        o.Name = o.Name + ' ' + o.Name;
    }

}