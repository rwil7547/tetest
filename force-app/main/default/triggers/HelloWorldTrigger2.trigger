trigger HelloWorldTrigger2 on Account (before insert) {
        System.debug ('Hello World');
}