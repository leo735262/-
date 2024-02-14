/*程式設計專題作業一 請設計一個Server-Client 架構的剪刀、石頭、布遊戲: 
1. 建立Server Socket並開啟Client Socket連結，隨機產生剪刀、石頭、布任一種結果，並將結果列印出來。 

2. 建立Client Socket連接至Server Socket後，由鍵盤輸入剪刀、石頭、布任一種結果後，傳送給Server Socket判斷： 
若Server贏了，Server Socket傳送”Server win”之訊息給Client Socket，並產生新的剪刀、石頭、布任一種結果，同時請Client Socket重新比賽。 
若Client贏了，Server Socket傳送”You win”之訊息給Client Socket，並產生新的剪刀、石頭、布任一種結果，同時請ClientSocket重新比賽。 

若Server或Client任何一方先獲得總計3次勝利者，Server Socket傳送Server或Client(Server win or You win)勝利訊息
    與比賽結果(Server win: X times, You win: X times)給Client Socket並且結束遊戲。 
繳交截止時間: 2020年5月4日晚上11:00 繳交方式: 將作業Java原始檔案上傳至i-learning作業一文件夾*/

import java.net.*;
import java.io.*;
public class server{
	public static void main(String[] args){
        //建立ServerSocket
		ServerSocket SocketServer = null;
		Socket SocketConnector = null;

		try{
            /*1.建立Server Socket並開啟Client Socket連結，隨機產生剪刀、石頭、布任一種結果，並將結果列印出來。 */
			SocketServer = new ServerSocket(8888);
            //分數紀錄
            int serverScore = 0,clientScore = 0;
            String result="null";
            String[] options = {"scissors","rock", "paper"};
            //Server出拳
            int n=(int)(Math.random()*3);
			System.out.println("first->"+options[n]);

			while(true){
				SocketConnector = SocketServer.accept();
                //輸入
			    BufferedReader clinet_rd = new BufferedReader(new InputStreamReader(SocketConnector.getInputStream()));
                String clinet_input;
                //輸出
				BufferedWriter to_clinet_wr = new BufferedWriter(new OutputStreamWriter(SocketConnector.getOutputStream()));
				
				while(true){
				    while((clinet_input = clinet_rd.readLine()) != null){
				        if(clinet_input.length() > 0 ){
				        	//System.out.println("<<client :"+str);
                            //輸贏判別
                            result=getResult(clinet_input, options[n]);
                            //紀錄分數
                            if(result.equals("You win")) clientScore++;
                            if(result.equals("Server win")) serverScore++;
                            //印出結果
                           // System.out.println("result:"+result);

                            //判斷有無需要結束(印出結果)
                            if(clientScore>=3) {
                                to_clinet_wr.write("You Win!!!  Server Win:  "+serverScore+"  times,  You Win:  "+clientScore+"  times\n");
                                to_clinet_wr.flush();
                                break;      
                            }
                            else if(serverScore>=3) {
                                to_clinet_wr.write("Server Win!!!  Server Win:  "+serverScore+"  times,  You Win:  "+clientScore+"  times\n");
                                to_clinet_wr.flush();
                                break;
                            }
                            else{
                                to_clinet_wr.write(result+"\n");
                                to_clinet_wr.flush(); 
                            }
			        	}
                        break;
			        }
                    //判斷有無需要結束(關閉連線)
                    if(clientScore>=3 || serverScore>=3){
                        SocketServer.close();
                        break;
                    }
                    //新局(產生新的剪刀、石頭、布任一種結果)
                    n=(int)(Math.random()*3);
                    result="null";
			        System.out.println("server>>"+options[n]);
				}
			}
		}
		catch(Exception e){
			System.out.println(e.toString());
		}
	}
    /*輸贏判別函式
     * 若Server贏了，Server Socket傳送”Server win”之訊息給Client Socket
     * 若Client贏了，Server Socket傳送”You win”之訊息給Client Socket
    */
    public static String getResult(String clientOption, String serverOption){
        if(clientOption.equals(serverOption)){
            return "tie";
        }else if(clientOption.equals("scissors") && serverOption.equals("rock")){
            return "Server win";
        }else if(clientOption.equals("scissors") && serverOption.equals("paper")){
            return "You win";
        }else if(clientOption.equals("rock") && serverOption.equals("paper")){
            return "Server win";
        }else if(clientOption.equals("rock") && serverOption.equals("scissors")){
            return "You win";
        }else if(clientOption.equals("paper") && serverOption.equals("scissors")){
            return "Server win";
        }else if(clientOption.equals("paper") && serverOption.equals("rock")){
            return "You win";
        }else return "Invalid input"; 
    }
}