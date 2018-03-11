#include "List.h"

List::List(int cap)
{
	size = 0;
	capacity = cap;
	array = new int[capacity];
}

// Destructor
List::~List()
{
	delete [] array;
}

bool List::insert(int el)
{
	if (size >= capacity)  	// defensive programming
		return false;	// pbc: to have isFull function

	array[size] = el;
	size++;
	return true;
}

int List::getElement(int index) const
{
	return array[index];
}

int List::getSize() const
{
	return size;
}

int List::getCapacity() const
{
	return capacity;
}
