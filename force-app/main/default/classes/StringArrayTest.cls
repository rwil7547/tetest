Public Class StringArrayTest{

    Public static List<String> generateStringArray(Integer n){
    
    List<String> myList =  new List<String>();
    for (Integer i=0; i<n; i++){
    	String myString = 'Test ' + i;
    	myList.add(myString);
    }

    return myList;
    
    }
}