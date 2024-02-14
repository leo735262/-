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

public class MyJava4 {
    public static void main(String[] args){
		Porsche p=new Porsche();
        Ferrari f=new Ferrari();
        Toyota t=new Toyota();
        p.maxSpeed();
        f.maxSpeed();
        t.maxSpeed();
	}
}
