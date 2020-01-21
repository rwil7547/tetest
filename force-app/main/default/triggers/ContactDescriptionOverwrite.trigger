trigger ContactDescriptionOverwrite on Opportunity (after insert) {

    List<Opportunity> allOpps = [SELECT id,
                                        CreatedBy.Firstname,
                                        CreatedBy.LastName,
                                        CloseDate,
                                        Accountid
                                FROM    Opportunity
                                WHERE id IN :trigger.new];

    List<Contact> toUpdate  = new List<Contact>();

    for (Opportunity o : allOpps){
        List<Contact> conts = [SELECT id,
                                      Description
                                FROM  Contact
                                WHERE AccountId = :o.Accountid];

        String oppInfo = ' ' + o.CreatedBy.FirstName + ' ' + 
                            o.CreatedBy.LastName + ', ' + o.CloseDate;

        for (Contact c : conts){
            if (c.Description != null){
                c.Description += '\n\n' + oppInfo;
            }
            c.Description = oppInfo;
            toUpdate.add(c);
        }
    }

    update toUpdate;

}