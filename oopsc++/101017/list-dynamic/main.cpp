#include "List.h"
#include <iostream>
using namespace std;

void printListInfo(List &);

int main()
{
  cout << "Create myList (capacity 10)...\n";
  cout << "Insert 5 into myList...\n"; 
  List myList(10);        
  myList.insert(5); 	

  cout << "Print myList info...\n";
  printListInfo(myList);	
  cout << endl; 

  cout << "Create myList2 (capacity 2)... \n";
  cout << "Insert 8 and 12 into myList2...\n"; 
  List myList2(2);			
  myList2.insert(8);			
  myList2.insert(12);  

  cout << "Print myList2 info...\n"; 
  printListInfo(myList2);   

  return 0;
}

void printListInfo(List & list)
{
  cout << "list contains: ";
  for (int i = 0; i < list.getSize(); i++)
    cout << list.getElement(i) << ' ';
  cout << endl;

  cout << "list size: " << list.getSize() << endl;                                
  cout << "list capacity: " << list.getCapacity() << endl; 
}
