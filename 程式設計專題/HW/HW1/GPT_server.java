import java.net.*;
import java.io.*;
public class GPT_server{
	public static void main(String[] args){
		ServerSocket SocketServer = null;
		Socket SocketConnector = null;
		try{
			SocketServer = new ServerSocket(8888);
            String[] options = {"scissors","rock", "paper"};
            int serverScore = 0;
            int clientScore = 0;
            int n=(int)(Math.random()*3);
            String serverOption = options[n];
            System.out.println(serverOption);//Server出拳

			while(true){
				SocketConnector = SocketServer.accept();
			    BufferedReader rd = new BufferedReader(new InputStreamReader(SocketConnector.getInputStream()));//輸入
				BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(SocketConnector.getOutputStream()));//輸出
				String str;

				while(true){
					str = rd.readLine();
				    if(str != null && !str.equals("end game")){
				    	System.out.println("client:"+str);
                        String result = getResult(str, serverOption);
                        System.out.println("result:"+result);
                        wr.write(result+"\n");
                        wr.flush(); 
                        if(result.equals("You win")) {
                            ++clientScore;
                        }else if(result.equals("Server win")) {
                            ++serverScore;
                        }
                        if(clientScore==3 || serverScore==3) {
                            wr.write("end game\n");
                            wr.flush();
                            SocketConnector.close();
                            break;
                        }
				    }else if(str != null && str.equals("end game")){
                        SocketConnector.close();
                        break;
                    }
				}
                if(clientScore>=3 || serverScore>=3){
                    SocketServer.close();
                    break;
                }else{
                    serverOption = options[(int)(Math.random()*3)];
                    System.out.println(serverOption);//Server出拳
                    serverScore = 0;
                    clientScore = 0;
                }
			}
		}
		catch(Exception e){
			System.out.println(e.toString());
		}
		finally{        
            System.out.println("Server disconnected...");
            try{        
                if(SocketServer != null){
                    SocketServer.close();
                }
            }catch(Exception e){        
                System.out.println(e.toString());        
            }
		}
	}
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

