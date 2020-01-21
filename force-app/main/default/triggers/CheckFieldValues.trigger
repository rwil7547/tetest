trigger CheckFieldValues on Case (before insert, before update) {
    for (Case c : Trigger.new) {
        if (c.Subject == null) {
            c.addError('Subject cannot be blank!');
        }
    }
}