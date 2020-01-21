/**
 * Created by ronanwilliams on 2019-07-17.
 */

public class testTimeController {


    @AuraEnabled
    public static Object getRecords(Id recordId){


        Object resObject = 'this';



        Campaign c = [SELECT Id, StartDate FROM Campaign WHERE Id = :recordId];

        List<Date> dates = new List<Date>();

        for (Integer x = 0; x < 5; x++){

            dates.add(c.StartDate.toStartOfWeek().addDays(1 + x));


        }





        return dates;
    }

}