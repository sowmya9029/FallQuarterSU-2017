package com.oops.iceweek9;

public abstract class Curves implements Shape {

	double xInterval;
	double yInterval;
	final double pi = Math.PI;
	
	public Curves(double xInterval, double yInterval) {
		super();
		this.xInterval = xInterval;
		this.yInterval = yInterval;
	}
	
    public double area() {
        // A = π r^2
        return pi * xInterval * yInterval;
    }
}
