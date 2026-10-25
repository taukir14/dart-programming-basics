void main(){
int age = 30;
print(age); // for integer number
double height = 5.9; //for floating number 
print(height);

String name = 'Jhon Doe'; //for string
print(name);

bool isStudent = true; //for boolean
print(isStudent); 


//list is like an array in dart programming languaage 

List myList = [1,2,3,4,5];
print(myList);

//Map is like an object in dart programming language
Map<String, dynamic> myMap = {
  'name' : 'Jhon Doe',
  'age' : 30,
  'height' : 5.9,
  'isStudent' : true};
print(myMap);

//set is a collection of unique items in dart programming language
Set mySet = {1,2,3,4,5}; //same value will not be added to the set example {1,2,3,4,5,5,5,5} will be {1,2,3,4,5}  
print(mySet);

//ruin is a special data type in dart programming language which is used to represent the absence of a value or a null value.
Null myNull = null; //null value
print(myNull);

final nameTwo = 'Taukir'; //final variable can be assigned only once and cannot be changed later
print(nameTwo.codeUnits); //codeUnits is a property of string which returns the list of unicode code units of the string

Runes input = Runes('\u{1F600}'); //runes is a special data type in dart programming language which is used to represent the unicode code points of a string
print(String.fromCharCodes(input)); //String.fromCharCodes is a method which converts the list


}