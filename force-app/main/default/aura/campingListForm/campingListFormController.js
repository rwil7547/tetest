({
	clickCreateItem : function(component, event, helper) {

        //  check for validation
        var checkField = component.find("itemform").reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);

        if (checkField)
        {
            //  gets refernce to view's newItem attribute
            var newItemRef = component.get("v.newItem");
            console.log("Create Camping Item: " + JSON.stringify(newItemRef));
 
            helper.createItem(component,newItemRef);                 
        }
        
        console.log('form js controller called');
	}
})