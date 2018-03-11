#ifndef RECTANGLE_H
#define RECTANGLE_H

class Rectangle
{
private:
	double length;
	double width;
public:
	Rectangle(double = 1.0, double = 1.0);
	double getLength() const;
	double getWidth() const;
	void setLength(double);
	void setWidth(double);
};

#endif
