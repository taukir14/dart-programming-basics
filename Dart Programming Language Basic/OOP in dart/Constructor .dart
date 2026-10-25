

class Const{
  String name;
  Const(this.name){
  print('this is my default constructor');
  print(name);}
}

// requred keyword + name Constructor/name function
class Const1{
  String name1;
  Const1({ required this.name1}){ //what is requred keyword? What is modifier ?
   
    print("This is my default Constructor1");
    print(name1);

  }
}
void main(){
  var Obj = Const('Taukir Tajammul'); //Constructor is a function its run during code compilation by it self when an object is created
  var Obj1 = Const1(name1: 'Tahmid Sachaya');

}