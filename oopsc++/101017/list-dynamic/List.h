#ifndef LIST_H
#define LIST_H

class List
{
public:
	List(int);
	~List(); 	// destructor
	bool insert(int);

	// accessors
	int getElement(int) const;
	int getSize() const;
	int getCapacity() const;

private:
	int size;	// # of elements in list
	int capacity;
	int * array;

	// suppress copying
	List(const List &);		// copy constructor
	List& operator=(const List &); 	// overloaded = operator

};

#endif
