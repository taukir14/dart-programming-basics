// in dart programming language there is no specific syntex for interface
//inteface is a kind of blueprint or you can say its work like a blueprint




void main(){
//interface -implements



//difference between extends and implements



}

class A{
  methodOne(){
    print('method one');
  }
  methodTwo(){
    print('method two');
  }
}

//Method 1: by using implements keywords(must need override)

class B implements A{
@override
methodOne() {

  }
@override
methodTwo() {

  }
 

}



//Method2: by using extends (override not mandatory)



// class B extends A{

// methodOne() {

//   }

// methodTwo() {

//   }
 

// }





//NB: in dart multiple inheritance is banned but we can use multiple interface using implements keywords