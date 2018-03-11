#include "List.h"
#include <iostream>
using namespace std;

int main()
{
	List myList;
	myList.insert(5);	// AP is responsible for checking
	cout << myList.getElement(0) << endl;

	return 0;
}
