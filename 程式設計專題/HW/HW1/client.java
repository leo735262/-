/*程式設計專題作業一 請設計一個Server-Client 架構的剪刀、石頭、布遊戲: 
1. 建立Server Socket並開啟Client Socket連結，隨機產生剪刀、石頭、布任一種結果，並將結果列印出來。 

2. 建立Client Socket連接至Server Socket後，由鍵盤輸入剪刀、石頭、布任一種結果後，傳送給Server Socket判斷： 
若Server贏了，Server Socket傳送”Server win”之訊息給Client Socket，並產生新的剪刀、石頭、布任一種結果，同時請Client Socket重新比賽。 
若Client贏了，Server Socket傳送”You win”之訊息給Client Socket，並產生新的剪刀、石頭、布任一種結果，同時請ClientSocket重新比賽。 

若Server或Client任何一方先獲得總計3次勝利者，Server Socket傳送Server或Client(Server win or You win)勝利訊息
    與比賽結果(Server win: X times, You win: X times)給Client Socket並且結束遊戲。 
繳交截止時間: 2020年5月4日晚上11:00 繳交方式: 將作業Java原始檔案上傳至i-learning作業一文件夾*/

import java.net.Socket;
import java.io.*;
public class client{
	public static void main(String[] args){
		Socket SocketClient = null;
		try{
            /*2. 建立Client Socket連接至Server Socket後，由鍵盤輸入剪刀、石頭、布任一種結果後，傳送給Server Socket判斷： */
			SocketClient = new Socket("localhost",8888);
            //連接成功
			System.out.println("***Connected to Server!***");
            //輸出
			BufferedWriter to_server_wr = new BufferedWriter(new OutputStreamWriter(SocketClient.getOutputStream()));
            //輸入
	        BufferedReader server_rd = new BufferedReader(new InputStreamReader(SocketClient.getInputStream()));
			int ch;
			String result;
            //分數紀錄 判斷是否要關閉連線
            int serverScore = 0,clientScore = 0;

			while (true) {
                if(clientScore>=3 || serverScore>=3){
                    System.out.print("**>end game!<**\n");
                    break;
                }
                //讀取使用者所鍵入的資料將其傳送至Server端的Socket
                else System.out.print("Please input : rock , paper or scissors ->");

				StringBuffer line_in = new StringBuffer();
				while ( (ch = System.in.read()) != 13)
                line_in.append( (char) ch );
                line_in.append((char)13);
				to_server_wr.write(line_in.toString());
				to_server_wr.flush();

                //等待資料傳入並接收資料且列印在螢幕上
		        while((result = server_rd.readLine()) != null){
		        	if(result.length() > 0 ){
		        		System.out.println(result);
                        //判斷遊戲是否結束
                        if(result.equals("You win")){
                            clientScore++;
                            System.out.println ("Play again!");
                        } 
                        if(result.equals("Server win")) {
                            serverScore++;
                            System.out.println ("Play again!");
                        }
                        for(int i=0;i<3;i++){
                                if(result.equals("Server Win!!!  Server Win:  3  times,  You Win:  "+i+"  times")) serverScore++;
                                if(result.equals("You Win!!!  Server Win:  "+i+"  times,  You Win:  3  times")) clientScore++;
                        }
                        //System.out.println("(Client Score:"+clientScore+","+"Server Score:"+serverScore+")");
		        		break;
		        	}
		        }
            }
		}
		catch(Exception e){
			System.out.println(e.toString());
		}
		finally{        
            if(SocketClient != null){
			    try{        
                    SocketClient.close();
                }
			    catch(Exception e){        
                    System.out.println(e.toString());        
                }
			}        
            System.out.println("***Client disconnected...***");
		}
	}
}
