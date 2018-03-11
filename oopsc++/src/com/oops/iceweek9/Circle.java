package com.oops.iceweek9;
public class Circle extends Curves {
 
    public Circle(double radius) {
    		super(radius,radius);
       
    }

    public double perimeter() {
        // P = 2πr
        return 2 * pi * xInterval;
    }
}