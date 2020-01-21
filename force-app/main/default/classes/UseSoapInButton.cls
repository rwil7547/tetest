global class UseSoapInButton {
    
    webservice static void myMethod(String oppId) {
        Opportunity opp = new Opportunity();
        opp.Id = oppId;
        opp.Name = 'Soap Update';
        update opp;
    }

}