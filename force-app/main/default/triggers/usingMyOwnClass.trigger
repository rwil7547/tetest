trigger usingMyOwnClass on Opportunity (before insert) {

    for (Opportunity o : trigger.new){
    myFirstClass.myFirstMethod();
   
}
}