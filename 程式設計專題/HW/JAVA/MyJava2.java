//封裝
class Car{
	int price;
	void maxSpeed(){
		System.out.println("100");
	}
}
//繼承
class Porsche extends Car{
    void maxSpeed(){
        System.out.println("280");
    }
}

public class MyJava2{
	public static void main(String[] args){
		Porsche p = new Porsche();
		System.out.println(p.price);
		p.maxSpeed();
	}
}