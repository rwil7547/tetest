({
	loadOptions : function(component) {
        var types = [{class: "optionClass", label: "5K", value: "5K"},
                     {class: "optionClass", label: "10K", value: "10K"},
                     {class: "optionClass", label: "Half-marathon", value: "Half-marathon"}];
        
        component.find("Type").set("v.options", types);		
	}
})