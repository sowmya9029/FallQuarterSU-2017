// pure virtual functions make a class abstract
#include<iostream>
using namespace std;

class Test
{
	int x;
public:
	virtual void show() = 0;
	int getX() { return x; }
};

int main(void)
{
	Test t; 		// why compile error?
	return 0;
}

// OUTPUT
//1_show.cpp: In function ‘int main()’:
//1_show.cpp:15:10: error: cannot declare variable ‘t’ to be of abstract type ‘Test’
//     Test t;
//          ^
//1_show.cpp:5:7: note:   because the following virtual functions are pure within ‘Test’:
// class Test
//       ^
//1_show.cpp:9:18: note: 	virtual void Test::show()
//     virtual void show() = 0;
//                  ^
