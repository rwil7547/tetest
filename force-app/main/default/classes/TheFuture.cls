public with sharing class TheFuture {
	
	@future
	public static void updateUserManagers(Set<Id> userIds, Id managerId) {

		List<User> usersToUpdate = new List<User>();

		for (Id userId : userIds){
			User u 		= new User();
			u.Id 		= userId;
			u.Managerid = managerId;
			usersToUpdate.add(u);
		}

		
	}
}