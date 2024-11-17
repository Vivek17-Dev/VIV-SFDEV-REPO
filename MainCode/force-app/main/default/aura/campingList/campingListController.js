({
    doInit: function(component, event, helper)
    {
        let action = component.get("c.getItems");
        //debugger;
        action.setCallback(this, function(response)
        {
          let state = response.getState();
            
            //console.log("state "+ State);
            
            if(state === "SUCCESS")
                
            {
                console.log("response.getReturnValue() " + response.getReturnValue());
                component.set("v.items", response.getReturnValue()); 
            }
            else{
                console.log("State" );
            }
                           });
        
        $A.enqueueAction(action);
        
    },
    
    handleAddItem: function(component, event, helper)
    {
        
            
            debugger;
            
            let Item = event.getParam("Item");
            console.log("Item "+ Item);
            let action = component.get("c.SaveItem");
          
            action.setParams({
                "CampList": Item
            });
            action.setCallback(this, function(response){
                                
               let state = response.getState();
                if(state == "SUCCESS") 
                {
                    let items = component.get("v.items");
                    items.push(response.getReturnValue());
                    
                    component.set("v.items", items);
                }              
                
            }) ;
            
            $A.enqueueAction(action);
        }
    
    
    
    
	

    })