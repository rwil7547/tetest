trigger DisqualifyTestLeads on Lead (before insert, before update) {

    String testValue = 'test';

    List<Lead> withValue = new List<Lead>();
    for( Lead m : trigger.new){

        if((m.FirstName != null && m.FirstName.equalsIgnoreCase(testValue)) 
            || (m.LastName != null && m.LastName.equalsIgnoreCase(testValue))){
            withValue.add(m);
        }
    }

    for( Lead p : withValue ){
        p.Status = 'Disqualified';
    }
    
}