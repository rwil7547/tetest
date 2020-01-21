public class makeAContact{

public static void makeContact(integer howMany){

    List<Contact> toUpload = new List<Contact>();

    while (howMany > 0) {
        Contact newCont = new Contact();
        newCont.FirstName = 'Rosie';
        newCont.LastName = 'Phillips' + ' ' + howMany;
        toUpload.add(newCont);
        howMany = howMany - 1;
        }
    
    insert toUpload;
}

public static String returnMyNumber(){

String myNumber = '2.14';
return myNumber;

}

}