public class AccountTest {
    public static void main(String[] args) {
        Account account1 = new Account("John Smith", 3.0);
        Account account2 = new Account("Bill Gates", 1000.8);

        System.out.printf("%s has balance %.2f%n", account1.getName(), account1.getBalance());
        System.out.printf("%s has balance %.2f%n", account2.getName(), account2.getBalance());

        try {
            account1.deposit(1.0);
            account2.deposit(562.7);
            account1.deposit(2.0);
            account2.deposit(532.5);
            account1.deposit(3.0);
            account2.deposit(62.5);
            account1.deposit(4.0);
            account2.deposit(2.7);
            account1.deposit(50.0);
            account2.deposit(562.6);
            account1.deposit(10.0);
            account2.deposit(52.7);
        } catch (IllegalArgumentException e) {
            System.out.println(e.getMessage());
        }

        System.out.printf("%s has balance %.2f after invalid deposit%n", account1.getName(), account1.getBalance());
        System.out.printf("%s has balance %.2f%n", account2.getName(), account2.getBalance());

        System.out.printf("%s has balance %.2f%n", account1.getName(), account1.getBalance());
        System.out.printf("%s has balance %.2f after valid deposit%n", account2.getName(), account2.getBalance());

        // Testing transaction history
        System.out.println("\nTransaction history for " + account1.getName() + ":");
        double[] history1 = account1.getHistory(3);
        for (double amount : history1) {
            System.out.print(amount + " ");
        }

        System.out.println("\nTransaction history for " + account2.getName() + ":");
        double[] history2 = account2.getHistory(5);
        for (double amount : history2) {
            System.out.print(amount + " ");
        }
    }
}
