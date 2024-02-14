//基礎類別(封裝))
/*class Car{
	int price;
	void maxSpeed(){
		System.out.println("100");
	}
}
*/
//抽象類別(abstract)用來轉型，不可單獨建立物件(不可 Car c=new Car():)
//也不可宣告為private權限(不可private abstract void maxSpeed();)
abstract class Car{
	int price;
	abstract void maxSpeed();
}
//繼承
class Porsche extends Car{
    void maxSpeed(){
        System.out.println("280");
    }
}

public class MyJava3{
	public static void main(String[] args){
		Car c=new Porsche();
        c.maxSpeed();
	}
}
