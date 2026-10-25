
void main(){
List contactList = [
  '01903105019',
  '01903105013',
  '01903103015',
  '01903105011'


];

//basic syntex 

for (int i = 0;i<contactList.length;i++){
  print(contactList[i]);
}
//continue keyword
for(var i = 0;i<10;i++){
  if(i == 5){
    continue;
  }
  print(i);
}
//brak keyword
for(var i = 0;i<10;i++){
  if(i == 5){
    break;
  }
  print(i);
}


//for in loop

List myList = ['A','B','C','D'];

for(var elements in myList){
  print(elements);


}

//for each loop 
var myList1 = [
  {'name': 'Name one'},
    {'name': 'Name Two'},
      {'name': 'Name Three'},
];

myList1.forEach((element) {
  print(element['name']);
  });

//while loop 
int i = 1;
int value = 5;
while(i<=value){
  print(i);
  i++;

}
//try do while loop by ypur self




}