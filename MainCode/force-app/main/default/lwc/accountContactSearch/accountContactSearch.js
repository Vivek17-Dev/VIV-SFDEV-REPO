import { LightningElement,wire,api, track } from 'lwc';
import getAccounts from'@salesforce/apex/AccountContactSearch.getAccounts';
import getContacts from'@salesforce/apex/AccountContactSearch.getContacts';
let i =0;
export default class AccountContactSearch extends LightningElement {
   
    @track items = [];
    @api contactdata;
    @api value;
    @wire (getAccounts,{}) wiredaccounts ({ error, data }) { if (data) {
        for(i=0; i<data.length; i++) {
            
            this.items = [...this.items ,{value: data[i].Id , label: data[i].Name}];                                   
        }                
        this.error = undefined;
    } else if (error) {
        this.error = error;
        this.accounts = undefined;
    };
}
    get options() {
        return this.items;
    }
    handleChange(event) {
        this.value = event.detail.value;
        
        console.log('value' + this.value);
        this.items;
        getContacts({ accountId: this.value })
		.then(result => {
            /*this.result.map(item => {
                item.Account = item.Account.Name;
             });*/
			this.contactdata = result.map(
                record => Object.assign(        
                  { "Account.Name": record.Account.Name},         
                  record         
                  )         
                  );;
            console.log('contacts' + this.contactdata[0].Account);
			this.error = undefined;
		})
		.catch(error => {
			this.error = error;
			this.contactdata = undefined;
		})
     

    }
   


}