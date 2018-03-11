#include <iostream>
using namespace std;

int main()
{
	int x;
	x = 5;
	cout << "&x: " << &x << endl;


	int * ptr = nullptr; // address 0
	ptr = &x;
	cout << "ptr: " <<  ptr << endl;
	cout << "*ptr: " << *ptr << endl;
	cout << "&ptr: " << &ptr << endl;

	// delete ptr; -- will cause an error because 
	// "new" keyword has not been used

	// dynamically allocate on the heap
	ptr = new int;
	*ptr = 123;

	cout << "ptr: " <<  ptr << endl;
	cout << "*ptr: " << *ptr << endl;
	cout << "&ptr: " << &ptr << endl;

	// deallocate
	delete ptr;

	ptr = nullptr;	// c++-11

	// dynamically allocate an array on the heap
	ptr = new int[5];

//	ptr[0] = 4;
//	ptr[1] = 5;
//	ptr[2] = 12;

	for (int i = 0; i < 5; i++)
		ptr[i] = i;

	cout << "ptr: " <<  ptr << endl;
	cout << "*ptr: " << *ptr << endl;
   	cout << "&ptr: " << &ptr << endl; 	

	for (int i = 0; i < 5; i++)
		cout << ptr[i] << endl;

	return 0;
}
