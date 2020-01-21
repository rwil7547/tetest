({
    getEMI : function(component, detail) {
        if(detail =="EMI"){
            document.getElementById("emiDiv").style.display = "block";
            document.getElementById("addchart").style.display = "none";
        }else if(detail =="Monthly"){
            document.getElementById("emiDiv").style.display = "none";
            document.getElementById("addchart").style.display = "block";
        }
        var loanAmt = document.getElementById('loanAmt').value;
        var months = document.getElementById('months').value;
        var rate = document.getElementById('rate').value;
         
        if (loanAmt == null || loanAmt.length == 0 || months == null || months.length == 0 || rate == null || rate.length == 0) {
            document.getElementById("err").style.display = "block";            
        } else {
            document.getElementById("err").style.display = "none";                           
            var rate1 = rate / 1200;
            var emi= loanAmt * rate1 / (1 - (Math.pow(1 / (1 + rate1), months)));
            document.getElementById('EMI').innerHTML = Math.round(emi);
            document.getElementById('interestP').innerHTML = Math.round(emi * months);
            document.getElementById('totalP').innerHTML = '£' + Math.round((document.getElementById('interestP').innerHTML) * 1 - loanAmt * 1);
             
            var tile='<ul class="slds-list--vertical slds-has-cards">';
            var balance=0;
            for(var i=1; i<=months; i++){                    
                if(i==1){
                    balance = loanAmt;                       
                }                       
                var interest = balance* (rate/100.0)/12;
                var Principal = emi - interest;
                balance = balance - Principal;
                 
                tile += '<li class="slds-list__item">';
                tile += '<div class="slds-tile slds-tile--board">';
                tile += '<p class="slds-tile__title slds-truncate"><a href="#">Month - '+ i +' </a></p>';
                tile += '<div class="slds-tile__detail">';
                tile += '<p class="slds-text-heading--medium">Installment - £'+ Math.round(emi) +'</p>';
                tile += '<p class="slds-truncate"><a href="#">Interest - £'+ Math.round(interest) +'</a></p>';
                tile += '<p class="slds-truncate">Balance - £'+ Math.round(balance) +'</p>';
                tile += '</div>';
                tile += '</div>';
                tile += '</li>';
            }
            tile += '</ul>';
            document.getElementById("addchart").innerHTML = tile;            
        }   
    }
})