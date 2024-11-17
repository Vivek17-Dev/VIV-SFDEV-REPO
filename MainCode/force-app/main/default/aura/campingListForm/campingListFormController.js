({
	clickCreateItem: function(component,event, helper)
    {
        let validExpense = component.find('CampingItemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            
        let newItem = component.get("v.newItem");
        console.log(newItem);
     helper.CreateItem(component, newItem);
        }
}
})