import java.util.*;
public class OOHW3 {
    public static void main(String[] args){
        int n=0;
        int max=0;
        int error_count=0;
        String[] s={"A","B","C","D","E"};
        int[] count ={0,0,0,0,0};

        Scanner sin = new Scanner(System.in);

        while(sin.hasNext()){   /*hasNext() return True/False */
            switch(sin.next()){
                case "A": case "a":
                    count[0]++;
                    break;
                case "B": case "b":
                    count[1]++;
                    break;
                case "C": case "c":
                    count[2]++;
                    break;
                case "D": case "d":
                    count[3]++;
                    break;
                case "E": case "e":
                    count[4]++;
                    break;
                default:
                error_count++;
            }
        }   
        
        for(int i=0;i<count.length;i++)
            if(count[max]<=count[i])
                max=i;


        System.out.printf("%s %d%n%d",s[max],count[max],error_count);
    }
}
