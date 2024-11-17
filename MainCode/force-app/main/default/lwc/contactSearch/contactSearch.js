import { LightningElement , api, wire} from 'lwc';
import getContacts from'@salesforce/apex/AccountContactSearch.getContacts';
import { refreshApex } from '@salesforce/apex';
import CONTACT_NAME from '@salesforce/schema/Contact.Name';
import CONTACT_EMAIL from '@salesforce/schema/Contact.Email';
import CONTACT_PHONE from '@salesforce/schema/Contact.Phone';
import ACCOUNT_NAME from '@salesforce/schema/Contact.Accountid';
const columns = [
    { label: 'Name', fieldName: 'Name' },
    { label: 'Account', fieldName: 'Account.Name'},
    { label: 'Email', fieldName:  'Email'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    
];
export default class ContactSearch extends LightningElement {


    @api accountid;
    @api _data;
    error;
    
    columns = columns;
   /* @wire (getContacts,{accountId : '$accountId'}) wiredContacts ({ error, data }) { if (data) {
        console.log('accName' + this.accountid);
        console.log('contacts' + data.CONTACT_NAME);
        this.contactData = data;
    } else if (error) {
        this.error = error;
        this.contactData = undefined;
    }
    }
    async getContactList() {
        try {
            this.contactdata = await getContacts({ accountId : this.accountId});
            this.error = undefined;
        } catch (error) {
            this.error = error;
            this.contactdata = undefined;
        }
    }*/
   @api 
   updateContactList() {
        this._data = this._data;
        console.log('accId' + this._data);
    }
    connectedCallback() {
        
        console.log('accId' + this._data);

    }
handleChange(event) {

    this._data.map(item => {
       item.Account = item.Account.Name;
    });
    console.log('data' + this._data)
    return this._data;
}
}