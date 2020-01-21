({
    packItem: function(component, event, helper){
        let item = component.get("v.item");
        item.Packed__c = true;
        component.set("v.item", item);
        component.set("v.disabled", true)
    },
    clickCreateItem: function(component, event, helper) {
        var validExpense = component.find('itemform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validExpense){
            // Create the new expense
            var newItem = component.get("v.newItem");
            console.log("Create expense: " + JSON.stringify(newItem));
            // createItem(component, newItem);
            var theItems = component.get("v.items");
            
            var newItem = JSON.parse(JSON.stringify(newItem));
    
            theItems.push(newItem);
            component.set("v.items", theItems);


        }
    },
    createItem: function(component, newItem) {
        var theItems = component.get("v.items");
        
        var newItem = JSON.parse(JSON.stringify(newItem));

        theItems.push(newItem);
        component.set("v.items", theItems);

    }    
})