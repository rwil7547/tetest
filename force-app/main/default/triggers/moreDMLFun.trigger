trigger moreDMLFun on Account (before insert, before update) {

    List<Contact> myContList = new List<Contact>();

    for (Account o : Trigger.new){
    if(o.Name == 'Homebase'){
    
    for(Integer i = 0; i<5; i++){
    Contact g = new Contact();
    g.FirstName = 'Gary';
    g.LastName = 'Marfleet';
    myContList.add(g);}
    }
    }
    
    insert myContList;
    
}