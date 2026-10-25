void main(){

final gendar = Gender.male; //enum is a special data type in dart programming language which is used to represent a fixed number of constant values 

switch(gendar){
  case Gender.male:
    print('Male');
    break;
  case Gender.female:
    print('Female');
    break;
  case Gender.other:
    print('Other');
    break;

  // default:
  //   print('Invalid gender');
}






  
}
  enum Gender {male, female, other} //enum is a special data type in dart programming language which is used to represent a fixed number of constant values