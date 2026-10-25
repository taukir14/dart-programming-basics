


void main(){

  //How to Define a Function in Dart
  void addTwoNumbers(int a, int b){
    print(a+b);
  }
  addTwoNumbers(10, 20);

  //Arrow function syntax
  //--its used when the function has only one line of code
  int Arrow(int a, int b) => a+b;
  print(Arrow(11, 20));

//return function
//--we use that function when we want to return value .its store value like a variable
  int returnFunction(int a, int b){
    return a+b;
  }
  print(returnFunction(10, 20));  

//Paramereized function
  int paramereizedFunction(int a , int b){
    return a+b;
  }
  print(paramereizedFunction(10, 20));

//optinal positinal Parameter [ ] function

myFunction(a,b,c,[d,e]){

  print(a);
  print(b);
  print(c);
  print(d);
  print(e);

}

myFunction(10,20, 30); //without d and e input
myFunction(22, 33, 44, 55,66); //with d,e input

//optional named parameter {}


myFunction2(a,b,c,{d,e}){

  print(a);
  print(b);
  print(c);
  print(d);
  print(e);

}
myFunction2(99,21,22);
print('break');
myFunction2(99,21,22,d:88,e:47);

//Higher order Function
//-- bangla: jokhon ekta function ar ekta function k as a parameter hishabe ney othoba return kore thkn sheta k higher order fucntion bole 

mainFucntion1();

addTWO(){
  print(10+20);
}

mainFunction2(addTWO);


} //from this line main functons scope


//syntex of higher order function
mainFucntion1(){
  return ()=>print('Return a function'); //it will return this arrow fucntion
}

mainFunction2(Function function){ //it will take function as a parameter 
  function(); 
}