package data;

public class Incident {
	private String ID;
	private String address;
	private String date;
	private String cleanDate;
	private String notes;
	private Point coordinate;
	private String manufacturer;
	private String plate;
	
	public Incident(String ID, String address, String date, String notes, Point coordinate, String manufacturer, String plate) {
		this.ID = ID;
		this.address = address;
		this.date = date;
		this.notes = notes;
		this.coordinate = coordinate;
		this.cleanDate = date.substring(0, 10);
		this.manufacturer = manufacturer;
		this.plate = plate;
	}
	
	public Point getCoordinate() {
		return this.coordinate;
	}
	
	public String getNotes() {
		return this.notes;
	}
	
	public String getDate() {
		return this.date;
	}

}

