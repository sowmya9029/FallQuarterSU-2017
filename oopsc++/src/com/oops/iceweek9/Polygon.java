package com.oops.iceweek9;

public abstract class Polygon implements Shape
{
     public Polygon(int numberOfSides) {
		super();
		this.numberOfSides = numberOfSides;
	}

	protected int numberOfSides;

	//int [] dimensions;
}
