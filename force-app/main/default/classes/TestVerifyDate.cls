@isTest
public class TestVerifyDate {
    
    public static testMethod void testEndofMonth(){
        Date sample = Date.newInstance(2017,08,08);
        Date changedDate = VerifyDate.SetEndOfMonthDate(sample);
        Date expectedDate = Date.newInstance(2017,08,31);
        
        System.assertEquals(expectedDate,changedDate);
    }
    
    public static testMethod void testDateRange(){
        Date sampleOne = Date.newInstance(2017,08,17);
        Date sampleTwo = Date.newInstance(2017,08,16);
        
        Boolean earlier = VerifyDate.DateWithin30Days(sampleOne, sampleTwo);
        System.AssertEquals(False,earlier);
        
        sampleTwo = sampleTwo.addDays(40);
        Boolean tooLate = VerifyDate.DateWithin30Days(sampleOne, sampleTwo);
        System.AssertEquals(False,tooLate);

		sampleTwo = sampleTwo.addDays(-10);        
        Boolean withinRange = VerifyDate.DateWithin30Days(sampleOne, sampleTwo);
        System.AssertEquals(True,withinRange);        
    }
    
    public static testMethod void checkDateReturn(){
        Date first = Date.newInstance(2017, 08, 01);
        Date second = Date.newInstance(2017, 08, 05);
        Date outcomeOne = VerifyDate.CheckDates(first,second);
        System.assertEquals(second, outcomeOne);
        
        second = second.addDays(50);
		Integer totalDays = Date.daysInMonth(first.year(), first.month());
        Date firstEndMonth = Date.newInstance(first.year(), first.month(), totalDays);
        Date outcomeTwo = VerifyDate.CheckDates(first,second);
        
        System.assertEquals(firstEndMonth, outcomeTwo);
        
        
    }


}