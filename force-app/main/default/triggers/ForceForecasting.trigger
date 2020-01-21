trigger ForceForecasting on User (before insert) {
    for (User UserInLoop : Trigger.new){
        UserInLoop.ForecastEnabled = True;
    }    
}