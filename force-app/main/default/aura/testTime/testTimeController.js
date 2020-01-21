/**
 * Created by ronanwilliams on 2019-07-17.
 */

({
    doInit : function($C,$E,$H){

        // console.log($C.get('c.getRecords'));
        // console.log($C.get('c.getRecords'));

        var recordsCall = $C.get('c.getRecords');
        recordsCall.setParams({
            recordId : $C.get('v.recordId')
        });
        recordsCall.setCallback(this, function(response){
            if (response.getState() === "SUCCESS"){

                console.log(response.getReturnValue());

                var dates = [];

                for (var x = 0; x< 5; x++){

                    dates.push(new Date(response.getReturnValue()[x]).toString().substring(0,10))

                }

                $C.set('v.dates',dates);


            }

            console.log(Object.keys($C.get('v.dates')));


            $C.set('v.codes',['1','2','3','4','5']);


        });
        $A.enqueueAction(recordsCall);




    },
    setRow : function($C,$E,$H){


        


    }
});