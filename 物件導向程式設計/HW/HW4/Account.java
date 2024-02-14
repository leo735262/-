    public class Account {
        private String name;
        private double balance; // record the balance
        private String historystr="";
    
        public Account(String name, double balance) {
            this.name = name;
            if (balance > 0) this.balance = balance;
        }
    
        public void setName(String name) {
            this.name = name; // store the name
        }
    
        public void deposit(double depositAmount) {
            if (depositAmount > 0.0) { // check validity
                balance += depositAmount;
                historystr=historystr+String.valueOf(depositAmount)+' ';
            }
            else
            throw new IllegalArgumentException("Illegal amount of deposit: " + String.format("%.1f", depositAmount));
        }
    
        public double getBalance() {
            return balance; // return the current balance
        }
    
        public String getName() {
            return name;
        }

        public double[] getHistory(int N){
            String[] buff = historystr.split(" ");
            int size = Math.min(N, buff.length);
            double[] history=new double[size];
            for(int i=0;i<size;i++){
                if(!buff[i].isEmpty())
                    history[i]=Double.valueOf(buff[i]);
            }
            return history;
            
        
        }
    }
    
