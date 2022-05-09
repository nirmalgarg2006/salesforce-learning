import { LightningElement,track,wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccController.findAccounts'

export default class ApexWireMethodWithParams extends LightningElement {
    @wire(getAccountList)accounts;
}