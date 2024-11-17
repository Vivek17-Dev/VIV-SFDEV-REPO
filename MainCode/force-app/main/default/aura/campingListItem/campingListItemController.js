({
	packItem : function(component, event, helper) {
        
		Component.set("v.item.Packed__c", true);
        let button = event.getSource();
    button.set('v.disabled',true);
       
	}
})