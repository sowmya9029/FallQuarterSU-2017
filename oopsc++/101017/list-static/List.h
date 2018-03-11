#ifndef LIST_H
#define LIST_H

const int CAPACITY = 10;

class List
{
public:
	List();
	bool insert(int);
	int getElement(int) const;

private:
	int size;	// # of elements in list
	int capacity;
	int array[CAPACITY];
};

#endif
