import { LightningElement, wire } from 'lwc';
import getTopAccounts from '@salesforce/apex/TopAccountsController.getTopAccounts';

export default class TopAccountsDisplay extends LightningElement {
    @wire(getTopAccounts)
    accounts;

    get hasAccounts() {
        return this.accounts && this.accounts.data && this.accounts.data.length > 0;
    }
}
