#include<iostream>
using namespace std;

class Base
{
	int x;
public:
	virtual void fun() = 0;
	int getX() { return x; }
};

// This class ingerits from Base and implements fun()
class Derived: public Base
{
	int y;
public:
	void fun() override { cout << "fun() called\n"; }
};

int main(void)
{
	Derived d;
	d.fun();
	return 0;
}

// OUTPUT
// fun() called
