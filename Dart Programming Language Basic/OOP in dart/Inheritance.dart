



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


}




void main(){

var son = Son();
son.methodTwo();

}