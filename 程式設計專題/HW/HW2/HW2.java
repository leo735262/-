/*程式設計專題作業二 
題目: 利用 Java IO 與 File 套件撰寫一記帳系統: 
1. 程式啟動後創建一記帳本檔案 account.txt. (10 分) 
2. 撰寫使用者輸入介面功能如下: 
    A. 使用者由鍵盤輸入”1”後，程式讀取 account.txt 記帳本檔案
        內容，並將所有內容顯示於電腦螢幕上後，回到使用者輸入介面。(40 分) 
    B. 使用者由鍵盤輸入”2”後，可以讓使用者由鍵盤輸入新的:
        (1)消費日期、(2)消費項目、(3)消費金額後，新增至計帳本account.txt 中，且不能將原計帳本內容覆蓋掉。
    並重新回到使用者輸入介面。(40 分) 
    C. 使用者由鍵盤輸入”3”後，程式結束。(10 分) 
繳交截止時間: 2023 年 5 月 18 日晚上 11:00 
繳交方式: 將 Java 原始檔案上傳至 i-learning 作業二文件匣 */

import java.io.*;
import java.util.Scanner;

public class HW2 {
    // 記帳本檔案名稱
    private static final String file_name = "account.txt";
    public static void main(String[] args) throws IOException {
        // 創建記帳本file
        create_account_File();
        // 宣告 Scanner 物件(讀取使用者輸入)
        Scanner scanner = new Scanner(System.in);

        while (true) {
            // 顯示使用者操作選項
            System.out.println("\n<Please enter the command:>\n1. view account\n2. add account\n3. end program");
            System.out.println("--------------------------");
            // 讀取使用者輸入
            String input = scanner.nextLine();
            // 如果使用者輸入 :1->顯示所有帳目 ; 2->新增帳目 ; 3->結束程式 ; 不正確->顯示錯誤訊息
            if (input.equals("3")) 
                break;
            else if (input.equals("2")) 
                add_account(scanner);
            else if (input.equals("1")) 
                display_accounts();
            else 
                System.out.println("Input errors, please re-enter.");
            
        }
        // 關閉 scanner 物件
        scanner.close();
    }

    // 創建記帳本file
    private static void create_account_File() throws IOException {
        // 建立file物件
        File file = new File(file_name);
        // 如果file不存在，則建立新file
        if (!file.exists()) 
            file.createNewFile();
    }

    // 顯示所有帳目
    private static void display_accounts() throws IOException {
        // 宣告 BufferedReader 物件讀取file內容
        BufferedReader reader = new BufferedReader(new FileReader(file_name));
        // 讀取file第一行
        String line = reader.readLine();

        // 如果file沒有內容，顯示提示訊息
        if (line == null) 
            System.out.println("<currently no account>");
        // 如果file有內容，則逐行讀取file並顯示
         else {
            System.out.println("--------------The following is the content of the file--------------------");
            while (line != null) {
                System.out.println(line);
                line = reader.readLine();
            }
            System.out.println("------------------Above is the content of the file-----------------------");
        }
        reader.close();
    }

    // 格式化新的記帳資料
    private static void add_account(Scanner scanner) throws IOException {
        // 詢問user輸入日期、項目、金額
        System.out.println("\nPlease enter the consumption date (format: yyyy/MM/dd):");
        String date = scanner.nextLine();

        System.out.println("Please enter consumption items:");
        String item = scanner.nextLine();

        System.out.println("Please enter the consumption amount:");
        String amount = scanner.nextLine();
        // 將輸入的data組合成一個新的帳目
        String newAccount = String.format("%s\t%s\t%s", "Date: " + date, "Item: " + item, "Amount of consumption: " + amount);
        // 將新帳目寫入記account.txt
        BufferedWriter writer = new BufferedWriter(new FileWriter(file_name, true));
        writer.write(newAccount);
        writer.newLine();
        writer.close();
        // 顯示新增的帳目
        System.out.println("\nAccount added:");
        System.out.println(newAccount);
        System.out.println("--------------------------");
    }
}
