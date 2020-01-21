public class CashFlowController {


        public List<Balance> balances {get;set;}
        //Integer dateRange;
        
        public static List<String> buildDescriptions() {
        
            List<String> descriptions = new List<String>();
            descriptions.add('First');
            descriptions.add('Second');
            descriptions.add('Third');
            return descriptions;                        
        }

        public class Balance {
                public Date balancedate {get; set;}
                public Decimal balance {get; set;}
                public Decimal displaybalance {get; set;}
                public Decimal displaybalance2 {get; set;}
                public String stringDate {get;set;}
                public Decimal debits {get; set;}
                public Decimal credits {get; set;}
                public String displaydate {get; set;}
                public String displayday {get; set;}
                public String thirds {get; set;}
            public String displayday2 {get;set;}
        }

        public static List<Balance> generateBalances() {

                Integer dateRange = 180;

                Set<Integer> randomDays = new Set<Integer>{1,2,133,9,14,19,160,21,24,1,115,26,27,28,34,2,136,39,40,41,4,43,55,56,58,111,113,112,118,121,171,165,149};
                
                List<Balance> balances = new List<Balance>();

                for (Integer x = 0; x < dateRange; x++) {            
                        Balance b = new Balance();
                        b.balancedate = Date.today().addDays(x);
                        b.stringDate = String.valueOf(b.balancedate.day()) + ' ' + 
                                        DateTime.newInstance(b.balancedate.year(), b.balancedate.month(), b.balancedate.day()).format('MMM') + ' ' + 
                                        DateTime.newInstance(b.balancedate.year(), b.balancedate.month(), b.balancedate.day()).format('YY'); 
                        b.credits = 0;
                        b.debits = 0;
                        b.balance = (x == 0 ? 25 : Math.round(Math.random()*700));
                        
                        if (randomDays.contains(x)) {
                                b.balance = Math.round(Math.random()* -2000);
                        }

                        b.displaybalance = (x == 0 ? b.balance : balances[x-1].displaybalance + b.balance);
                        
                        b.displaybalance2 = b.displaybalance * math.random();
                                                b.displayday = String.valueOf(b.balancedate.day()) + ' ' +  
                                                        Datetime.newInstance(b.balancedate.year(),b.balancedate.month(),b.balancedate.day()).format('MMM'); 
                                                        
                                                        
                         if (Datetime.newInstance(b.balancedate.year(),b.balancedate.month(),b.balanceDate.day()) == 
                            Datetime.newInstance(b.balancedate.year(),b.balancedate.month(),b.balanceDate.toStartofWeek().day())){
                        b.displayday2 = String.valueOf(b.balancedate.day()) + ' ' +  
                                                        Datetime.newInstance(b.balancedate.year(),b.balancedate.month(),b.balancedate.day()).format('MMM');                                
                           } else {
                                                                        b.displayday2 = '';                                
                            }

                        b.displayday = Datetime.newInstance(b.balancedate.year(),b.balancedate.month(),b.balancedate.day()).format('EEE');
                        balances.add(b);
                    b.displaydate = b.displayday;
                }  
                
                
                Integer thirdsInt  = 0;
                
                for (Balance b : balances) {
                    thirdsInt  += 1;
                    
                    if (thirdsInt  == 7) {
                        b.thirds = b.stringDate;
                        thirdsInt = 0;  
                    } else {
                        b.thirds = '';
                    
                    }
                }             

                return balances;
        }

        @RemoteAction
        public static List<Balance> getBalances() {
                return CashFlowController.generateBalances();
        }

        @RemoteAction
        public static List<Balance> getMoreBalances() {
                return CashFlowController.generateBalances();
        }        
        
        
        @RemoteAction
        public static List<String> getStrings() {
                return CashFlowController.buildDescriptions();
        }

        public CashFlowController() {
               balances =  CashFlowController.generateBalances();
        }
}