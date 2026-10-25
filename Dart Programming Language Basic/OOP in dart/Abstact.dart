
//dart dont support method overloading but its supports override 






abstract class Father{


  int age = 50;
  methodOne(){
    print("This is method 1");
  }

  methodTwo(){
    print('This is method 2');
  }
}


class Son extends Father{

  String name = 'son';

  @override
  methodOne() {
   print('this is overridden method');
  }

}




void main(){

//var father = Father(); //to run this file plz make this statement into comment 
var son = Son();
son.methodOne();

}