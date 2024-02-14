abstract class Car{
	int price;
	abstract void maxSpeed();
}
//轉型是多形的基礎
class Toyota extends Car{
    void maxSpeed(){
        System.out.println("180");
    }
}

class Porsche extends Car{
    void maxSpeed(){
        System.out.println("280");
    }
}

class Ferrari extends Car{
    void maxSpeed(){
        System.out.println("320");
    }
}

public class MyJava5 {
    public static void main(String[] args){
		Car[] c={new Porsche(),new Ferrari(),new Toyota()};//車子的集合
        for(int i=0;i<c.length;i++){
            c[i].maxSpeed();
        }
	}
}