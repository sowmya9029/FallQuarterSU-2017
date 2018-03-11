package com.oops.iceweek9;

class Ellipse extends Curves
{

	public Ellipse(double xInterval, double yInterval) {
		super(xInterval, yInterval);
	}

	@Override
	public double perimeter() {
		return 2*pi*Math.sqrt((Math.pow(xInterval,2)+Math.pow(yInterval,2))/2);
	}


}

