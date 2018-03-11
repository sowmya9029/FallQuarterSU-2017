#include "List.h"

List::List()
{
	size = 0;
}

bool List::insert(int el)
{
	if (size >= CAPACITY)  	// defensive programming
		return false;	// pbc: to have isFull function

	array[size] = el;
	size++;
	return true;
}

int List::getElement(int index) const
{
	return array[index];
}
