package com.flightproject;

public class FlightInfo {
	
	private String 	flightName;
	private String 	source;
	private String 	destination;
	private int 	flightId;
	private String  sAirport;
	private String  dAirport;
	private float  	price;
	
	public FlightInfo()
	{		
	}
	
	public FlightInfo(String flightName, String source, String destination, 
					  int flightId, String sAirport, String dAirport, float price) {
		super();
		this.flightName = flightName;
		this.source = source;
		this.destination = destination;
		this.flightId = flightId;
		this.sAirport = sAirport;
		this.dAirport = dAirport;
		this.price = price;
	}
	
	//Getters
	public String getFlightName() {
		return flightName;
	}
	public String getSource() {
		return source;
	}
	public String getDestination() {
		return destination;
	}
	public int getFlightId() {
		return flightId;
	}
	public String getSrcAirport() {
		return sAirport;
	}
	public String getDestAirport() {
		return dAirport;
	}	
	public float getPrice() {
		return price;
	}	
	
}
