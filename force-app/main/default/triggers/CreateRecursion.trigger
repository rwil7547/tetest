trigger CreateRecursion on Lead (after insert) {

    List<Account> p = new List<Account>();

    for (Lead l : trigger.new){

        Account m       = new Account();
        m.Name          = 'Hellooooo';
        m.OwnerId   = [SELECT id FROM User WHERE FirstName = 'Best'].id;
        p.add(m);
    }

    insert p;

}