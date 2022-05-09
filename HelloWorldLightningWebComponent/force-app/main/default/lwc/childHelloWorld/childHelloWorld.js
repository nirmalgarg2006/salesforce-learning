import { LightningElement,api, track } from 'lwc';

export default class ChildHelloWorld extends LightningElement {
    @api personMessage;

    @track
    uppercaseitemname;

    @api
    get itemName(){
        return this.uppercaseitemname;
    }

    set itemName(value){
        this.uppercaseitemname = value.toUpperCase();
    }

    @api
    displayAlert(){
        alert('Child method');
    }

    hanldeclick(){
        const event = new CustomEvent('helloevent',{
            detail:'Hello Nirmal'
        });

        this.dispatchEvent(event);
    }
}