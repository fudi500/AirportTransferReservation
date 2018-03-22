package pl.fudalewski.ATR.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Destination {

	@Id
	@GeneratedValue
	private Long id;

	private String destinationName;

	private double price1to3;
	private double price4to8;
	private double price9to16;
	private double price17to40;
	
	@ManyToOne
	private StartLocation startlocation;

	
	public StartLocation getStartLocation() {
		return startlocation;
	}

	public void setStartLocation(StartLocation startLocation) {
		this.startlocation = startLocation;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDestinationName() {
		return destinationName;
	}

	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}

	public double getPrice1to3() {
		return price1to3;
	}

	public void setPrice1to3(double price1to3) {
		this.price1to3 = price1to3;
	}

	public double getPrice4to8() {
		return price4to8;
	}

	public void setPrice4to8(double price4to8) {
		this.price4to8 = price4to8;
	}

	public double getPrice9to16() {
		return price9to16;
	}

	public void setPrice9to16(double price9to16) {
		this.price9to16 = price9to16;
	}

	public double getPrice17to40() {
		return price17to40;
	}

	public void setPrice17to40(double price17to40) {
		this.price17to40 = price17to40;
	}

}
