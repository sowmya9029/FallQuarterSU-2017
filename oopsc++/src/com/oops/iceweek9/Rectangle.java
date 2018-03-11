package com.oops.iceweek9;

public class Rectangle extends Polygon {
    private final double width, length; //sides

  
    public Rectangle(double width, double length,int sides) {
    	    super(sides);
        this.width = width;
        this.length = length;
    }

    @Override
    public double area() {
        // A = w * l
        return width * length;
    }

    @Override
    public double perimeter() {
        // P = 2(w + l)
        return 2 * (width + length);
    }

}