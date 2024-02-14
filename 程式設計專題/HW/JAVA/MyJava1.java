//封裝
class Car{
	int price;
	void maxSpeed(){
		System.out.println("100");
	}
}

public class MyJava1{
	public static void main(String[] args){
		Car c = new Car();
		System.out.println(c.price);
		c.maxSpeed();
	}
}
