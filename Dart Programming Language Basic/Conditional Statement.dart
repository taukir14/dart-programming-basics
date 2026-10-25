
void main(){
  int age = 20;
  if(age >= 18){
    print('You are eligible to vote');
  }else{
    print('You are not eligible to vote');
  }

  String connection = 'wifi';
  if(connection == 'wifi'){
    print('You are connected to wifi');

  }
  else if(connection == 'mobile data'){
    print('You are connected to mobile data');
  }
  else{
    print('You are not connected to any network');
  }

  switch(connection){
    case 'wifi':
      print('You are connected to wifi');
      break;
    case 'mobile data':
      print('You are connected to mobile data');
      break;
    default:
      print('You are not connected to any network');
  }



}