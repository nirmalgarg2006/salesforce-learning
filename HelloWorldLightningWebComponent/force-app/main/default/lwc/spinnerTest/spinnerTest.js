import { LightningElement,track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent'
import getAccounts from '@salesforce/apex/AccountController.getAccountList';
export default class SpinnerTest extends LightningElement {
    @track accounts;
    @track errors;

    handleClick(){
        //alert('Button Clicked');
        getAccounts()
        .then((result)=>{
            //alert('success');
            const toastEvent = new ShowToastEvent({
                title : 'Success!',
                message : 'Accounts have been fetched',
                variant : 'success',
                mode : 'dismissable'
            });
            console.log(result);
            this.accounts = result;
            this.errors = undefined;
            this.dispatchEvent(toastEvent);
        })
        .catch((error)=>{
            const toastEvent = new ShowToastEvent({
                title : 'Error!',
                message : 'Error Occurred',
                variant : 'error',
                mode : 'dismissable'
            });
            console.log(error);
            this.errors = error;
            this.accounts = undefined;
            this.dispatchEvent(toastEvent);
        });
    }
}