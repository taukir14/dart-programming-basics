void main(){

List<String> mylist = ['Taukir', 'Avoy', 'Sachaya', 'Shishir', 'Pleto','Udoy','Mahi']; //list is a collection of data which can be of any data type and it can be of any length
print(mylist); //print the list
print(mylist.length); //print the length of the list
print(mylist[2]); //print the first element of the list
mylist.add('Rasel');
print(mylist); //print the list after adding a new element

mylist.addAll(['Rasel', 'Sakib', 'Rifat']);
print(mylist); //print the list after adding new elements

mylist.remove('Rasel'); //remove the element from the list
print(mylist); //print the list after removing an element 

mylist.removeAt(2); //remove the element at index 2
print(mylist); //print the list after removing an element at index 2

mylist.insert(0, 'James'); //insert the element at index 0
print(mylist); //print the list after inserting an element at index 0


List<int> mylist2 = [1,2,3,4,5,6,7,8,9,10]; //list of integer
print(mylist2); //print the list of integer

mylist2.replaceRange(0, 5, [11, 12, 13, 14, 15]); //mylist2.replaceRange(, end, replacements)
print(mylist2); //print the list after replacing the range of elements


//Task : There are lot of built in function ,its also vailable for map and set .
//my advice for you to search more about these functions it it will help you  a lot in your future career as a dart developer.

}