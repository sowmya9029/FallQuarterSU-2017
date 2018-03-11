#include<iostream>
using namespace std;

// An abstract class with constructor
class Base
{
protected:
	int x;
public:
	Base(int i) { x = i; }
	virtual void fun() = 0;
};

class Derived: public Base
{
	int y;
public:
	Derived(int i, int j):Base(i) { y = j; }
	void fun() override { cout << "x = " << x << ", y = " << y << endl; }
};

int main(void)
{
	Derived d(4, 5);
	d.fun();
	return 0;
}

// OUTPUT
// x = 4, y = 5
