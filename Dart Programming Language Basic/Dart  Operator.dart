
void main(){
  int a  = 10;
  int b = 20;
  print(a + b); //addition operator
  print(a - b); //subtraction operator
  print(a * b); //multiplication operator
  print(a / b); //division operator
  print(a % b); //modulo operator

  var result = a~/b; //integer division operator
  print(result);


  var  result1 = a<b; //less than operator
  var  result2 = a>b;

  print(result1);
  print(result2);

  //Type test Operator 
  String name = 'Taukir';
  print(name is String); //is operator
  print(name is! String); //is not operator


  //conditional operators (ternary operator)
  var result3 = a < b ? 'a is less than b' : 'a is not less than b';
  print(result3);
  //conditional operator (null aware operator)
  

}