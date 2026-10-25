void main(){
  String a = 'We';
  String b = 'are';
  String c = 'Learning';
  String d = 'Dart';


//String Literal
  String e = 'We' 'Are' 'Learning' 'Dart'; //String concatenation


//1st step
print(a+b+c+d); //String concatenation
//2nd step
print('$a$b$c$d'); //String interpolation
//3rd step
print(e); //String concatenation
//4th step
print('${a} ${b} ${c} ${d}'); //String interpolation with space

//5th step
List<String> myList = ['We', 'Are', 'Learning', 'Dart'];
print(myList.join(' ')); //String concatenation with space using join method
print(myList.join('-')); //String concatenation with hyphen using join method
print(myList.join()); //String concatenation without space using join method

}