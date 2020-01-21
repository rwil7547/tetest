global class NewCaseController {

        public String theString {get; set;}

        public Case newCase {get; set;}

        public static String thisString = 'Text recieved from controller';

    @RemoteAction
    global static String createCase(String email, String issueType, String description) {

        Case newCase = new Case(
                Email__c                = email,
                Issue_Type__c   = issueType,
                Issue_Description__c = description
        );

        Try {
                insert newCase;
                return 'Case successfully inserted';
        } catch (Exception e) {
                return 'There is a problem with the case ' + e;
        }

    }

        public NewCaseController() {
        
                theString = 'Hello';

                RecordType rt = [select Id FROM RecordType WHERE Name ='ITCase' AND SObjectType = 'Case'];

                newCase = new Case(
                        RecordTypeId    = rt.Id,
                        Type                    = 'sample type here',
                        Reason                  = 'sample reason here',
                        Origin                  = 'Web Form'
                        );
                //thisString = 'Text recieved from controller';

        }
}