import java.net.Socket;
import java.io.*;

public class GPT_client {
public static void main(String[] args) {
Socket SocketClient = null;
int serverWin = 0;
int clientWin = 0;
int count = 0;
    try {
        SocketClient = new Socket("localhost", 8888);
        System.out.println("Connected to Server...");

        BufferedReader rd = new BufferedReader(new InputStreamReader(SocketClient.getInputStream()));
        BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(SocketClient.getOutputStream()));
        int ch;
        String str;
        while (true) {
            count++;
            if (serverWin == 3) {
                wr.write("Server win: " + serverWin + ", You win: " + clientWin + "\n");
                wr.write("Game over. Server wins.\n");
                wr.flush();
                break;
            } else if (clientWin == 3) {
                wr.write("Server win: " + serverWin + ", You win: " + clientWin + "\n");
                wr.write("Game over. You win.\n");
                wr.flush();
                break;
            }

            //隨機產生剪刀石頭布
            String[] choices = { "scissors", "rock", "paper" };
            String serverChoice = choices[(int) (Math.random() * 3)];

            System.out.println("Game " + count + ": " + serverChoice);

            // 讀取使用者所鍵入的資料將其傳送至Server端的Socket
            System.out.print("rock, paper, scissors?>");
            StringBuffer sb = new StringBuffer();
            while ((ch = System.in.read()) != 13)
                sb.append((char) ch);
            sb.append((char) 13);
            wr.write(sb.toString());
            wr.flush();

            //等待資料傳入並接收資料且列印在螢幕上
            while ((str = rd.readLine()) != null) {
                if (str.length() > 0) {
                    System.out.println(str);
                    if (str.contains("win")) {
                        if (str.equals("Server win")) {
                            serverWin++;
                        } else {
                            clientWin++;
                        }
                        break;
                    }
                }
            }
        }
    } catch (Exception e) {
        System.out.println(e.toString());
    } finally {
        if (SocketClient != null) {
            try {
                SocketClient.close();
            } catch (Exception e) {
                System.out.println(e.toString());
            }
        }
        System.out.println("Client disconnected...");
    }
}
}