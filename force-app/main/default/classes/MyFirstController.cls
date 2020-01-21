public class MyFirstController {

	private final Account account;


	public MyFirstController() {
		account = [SELECT id, Name, Site FROM Account
					WHERE Id = :ApexPages.currentPage().getParameters().get('id')];		
	}

	public Account getAccount(){
		return account;
	}

	public PageReference save(){
		update account;
		return null;
	}
}