void main(){


//Exception Handeling -try ,on,catch,stack-trace,finally

//format exception

try{
int result = int.parse('22');
print(result);
print(result.runtimeType);
}
catch(e){
print(e);


}

try{
var result = 10~/0;
print(result);

}
on IntegerDivisionByZeroException{
  print("impossible to divide by 0");
}
catch(e){
  print(e);
}finally{
  print('always exicuted');
}






//Custom Exception

//value(66);
try{
  value(4);
}
catch(e){
  print(e);

}







}

class Value implements Exception {
  String lessThenFive() {
    return 'value can not be less then five';
  }

  String greaterThenTen() {
    return 'value must be between 5-10';
  }
}

value(int v) {
  if (v < 5) {
    throw Value().lessThenFive();
  } else if (v > 10) {
    throw Value().greaterThenTen();
  }
}