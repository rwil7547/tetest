trigger ConvertToMember on Lead (before update) {

    // Make a list of leads that need to be converted
    List<Lead> leadsToConvert = new List<Lead>();
    for (Lead l : Trigger.new) {
        if (l.Status == 'Member'){
            leadsToConvert.add(l);
        }
    }

    // now let's create an object of the converter class
    SpecialLeadConvert slc = new SpecialLeadConvert(leadsToConvert);

    // use the object'smethos to convert it's leads
    slc.convertToMembers();

    // don't forget to use system.debug
    System.debug('Members created: ' + slc.getMembers());
}