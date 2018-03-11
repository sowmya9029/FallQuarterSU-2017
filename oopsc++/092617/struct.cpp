#include <iostream>
using namespace std;

struct Rectangle
{
	double length;
	double width;
};

int main()
{
	Rectangle r;
	r.width = 5;
	r.length = 7;

	cout << "width: " << r.width << "\n";
	cout << "length: " << r.length << endl;
	return 0;
}
