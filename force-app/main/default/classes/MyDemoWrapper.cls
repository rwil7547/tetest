public class MyDemoWrapper {
    
    // this is the inner class
    public class TableRow{
        public string Name {get;set;}
        public string Phone {get; set;}
        public string Company {get; set;}
    }

    public class OppTableRow{
        public string Name {get;set;}
        public decimal Amount {get; set;}
        public date CloseDate {get; set;}
    }    
    
    // lets see what this does 
    public List<TableRow> rowList {get; set;}
    public List<OppTableRow> oppRowList {get; set;}
    
    // here's the constructor for the parent class
    public MyDemoWrapper(){
        
        rowList = new List<TableRow>();
        TableRow tr;
        
        for (Contact con : [SELECT Name, Phone, Account.Name
                            FROM Contact LIMIT 10]){
            tr = new TableRow();
            tr.Name = con.Name;
            tr.Phone = con.Phone;
            tr.Company = con.Account.Name;
			
            RowList.add(tr);
        }
        
        oppRowList = new List<OppTableRow>();
        OppTableRow otr;
        
        for (Opportunity opp : [SELECT Name, Amount, CloseDate
                            FROM Opportunity LIMIT 10]){
            otr = new OppTableRow();
            otr.Name = opp.Name;
            otr.Amount = opp.Amount;
            otr.CloseDate = opp.CloseDate;
			
            OppRowList.add(otr);
        }
    }
}