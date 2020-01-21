trigger usingLists2 on Account (before insert, before update) {

    List<String> myBigList = new List<String>();
    myBigList.add('Ronan');
    myBigList.add('Dani');
    myBigList.add('Toby');
    
    for (Account lumpy : trigger.new){
    lumpy.List_Dump__c = myBigList[0];
    
    }
   

}