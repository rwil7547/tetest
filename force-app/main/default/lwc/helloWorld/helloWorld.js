import { LightningElement, wire, track  } from 'lwc';
import getContactList from '@salesforce/apex/ContactController.getContactList';
import PARK_MAP_URL from '@salesforce/resourceUrl/CaliforniaPark';
import MAP_MARKER_URL from '@salesforce/resourceUrl/PinImage';
export default class HelloWorld extends LightningElement {
    @track relocate = true;
    @track goodbye = ',mn,m !';
    @track contacts;
    @track error;
    @track selectedPitch = {number: '1',cordX: 34,cordY:67,style:'position:absolute;left:34%;top:67%'};
    @track pitches = [
        {number: 0,cordX: 34,cordY:67,style:'position:absolute;left:56%;top:23%',status: 'Owner'},
        {number: 1,cordX: 29,cordY:43,style:'position:absolute;left:13%;top:67%',status: 'Owner'},
        {number: 2,cordX: 89,cordY:32,style:'position:absolute;left:33%;top:78%',status: 'Available'},
        {number: 3,cordX: 65,cordY:89,style:'position:absolute;left:67%;top:92%',status: 'Owner'},
        {number: 4,cordX: 78,cordY:61,style:'position:absolute;left:77%;top:44%',status: 'Owner'},
        {number: 5,cordX: 43,cordY:13,style:'position:absolute;left:31%;top:21%',status: 'Available'},
        {number: 6,cordX: 43,cordY:13,style:'position:absolute;left:34%;top:23%',status: 'Available'},
        {number: 7,cordX: 43,cordY:13,style:'position:absolute;left:65%;top:24%',status: 'Owner'},
        {number: 8,cordX: 43,cordY:13,style:'position:absolute;left:39%;top:26%',status: 'Owner'},
        {number: 9,cordX: 43,cordY:13,style:'position:absolute;left:40%;top:28%',status: 'Available'},
        {number: 10,cordX: 43,cordY:13,style:'position:absolute;left:42%;top:29%',status: 'Owner'},
        {number: 11,cordX: 43,cordY:13,style:'position:absolute;left:45%;top:23%',status: 'Owner'},
        {number: 12,cordX: 43,cordY:13,style:'position:absolute;left:67%;top:33%',status: 'Owner'},
    ];

    parkMapUrl = PARK_MAP_URL;
    marker = MAP_MARKER_URL;

    @wire(getContactList) wiredContacts({ error, data }) {
        console.log('data', data);
        this.contacts = data ? data : undefined;
        this.error = error ? error : undefined;
    }

    changeHandler(event) {
        this[event.target.dataset.value] = event.target.value;
    }

    toggleRelocate(event){
        this.relocate = !this.relocate;
    }


    log(event){
        console.log('event target data',event.target.dataset.num);
        this.selectedPitch = this.pitches[event.target.dataset.num];
    }

    checkPos(event){

        var width       = event.currentTarget.parentNode.getBoundingClientRect().right - event.currentTarget.parentNode.getBoundingClientRect().left;
        var height      = event.currentTarget.parentNode.getBoundingClientRect().bottom - event.currentTarget.parentNode.getBoundingClientRect().top;
        var offsetLeft  = event.currentTarget.parentNode.getBoundingClientRect().x;
        var offsetTop   = event.currentTarget.parentNode.getBoundingClientRect().y;

        if ((((event.clientX - offsetLeft) / width) * 100) > 0){

            console.log((((event.clientX - offsetLeft) / width) * 100).toFixed(2));   
            console.log((((event.clientY - offsetTop) / height) * 100).toFixed(2)); 


            let left    = (((event.clientX - offsetLeft) / width) * 100).toFixed(2);
            let top     = (((event.clientY - offsetTop) / height) * 100).toFixed(2);    

            this.selectedPitch.style = 'position:absolute;left:' + left + '%;top:' + top + '%';
        }
    }
}