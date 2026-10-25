
//dart dont support method overloading but its supports override 






class Father{


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

var son = Son();
son.methodOne();

}