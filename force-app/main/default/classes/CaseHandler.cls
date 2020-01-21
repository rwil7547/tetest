public class CaseHandler {
    
    public static void updateOwner (List<Case> newCases){
        
        List<String> caseDesc = new List<String>();
        
        for (Case c : newCases){
            if (c.Description != null){
                caseDesc.add(c.Description);
            }
        }
        
        List<User> allusers = [SELECT Id, Email FROM User WHERE Email IN :caseDesc];
        
        Map<String,Id> userInfo = new Map<String,Id>();
        
        for (User u : allUsers){
            userInfo.put(u.Email, u.id);
        }
        
        for (Case c : newCases){
            c.OwnerId = userInfo.get(c.Description);
        }
        

    }

}