public with sharing class InsertNewAccount {

	public static Account ReturnAccount(String p){
		Account a = new Account(Name= p);
		insert a;
		return a;
	}


	public InsertNewAccount() {
		
	}
}