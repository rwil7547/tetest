public class MyHelloWorld333 {

public static void applyDiscount(Book__c[] books) {
   for (Book__c b :books){
      b.Price__c *= 0.9;
      b.Apex_Update__c = 'Ive been updated!';
   }
}

}