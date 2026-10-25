class Example1Class{
  int?_age; //by using underscore(-) we made that variable private
  set setAge(int a ){ //setter 
    _age=a;


  }
  get getAge{ //getter 
    return _age;
  }
  //int _age = 10; //we use underscore before the name of variable to define it private 
}