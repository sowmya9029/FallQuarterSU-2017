#include <iostream>
using namespace std;

class Rectangle
{
private:
	double length;
	double width;
public:
	double getLength() const
	{
		return length;
	}
	double getWidth() const
	{
		return width;
	}
	void setLength(double length)
	{
		this->length = length;
	}
	void setWidth(double w)
	{
		width = w;
	}
};

int main()
{
	Rectangle r;
	r.setWidth(5);
	r.setLength(7);

	cout << "width: " << r.getWidth() << "\n";
	cout << "length: " << r.getLength() << endl;
	return 0;
}
