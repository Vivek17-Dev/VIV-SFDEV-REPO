({
    CreateItem: function(component, newItem)
    {
        debugger;
        console.log("newItem "+ newItem);
        let addItem = component.getEvent("addItem");
        addItem.setParams({"Item" : newItem});
        
        addItem.fire();
        
        component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                'Name': '',
                'Quantity__c': 0,
                'Price__c': 0,
                'Packed__c': false});
    }
})