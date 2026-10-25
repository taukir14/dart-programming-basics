void main(){
//null safety(?,!,late);

String? name; // -- '?' this sign mean exclamatory 
print(name);
 


convertStringInt('55');
convertStringInt(name!);


//  convertStringInt(value){
//   int.parse(value);}

}
 convertStringInt(value){
 print( int.parse(value));

 //late keyword is kind of a promist ,its told us the value is null now, later it will be assign with the value 
 
 
  }