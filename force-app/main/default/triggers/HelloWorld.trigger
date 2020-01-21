trigger HelloWorld on Lead (before insert) {
    for (Lead I : Trigger.new ) {
        I.FirstName = 'Hello';
        I.LastName = 'World';
    }
}