package com.gobook.location.dto;

public class LocationDto {
	private int location_num;
	private String location_address1;
	private String location_address2;
	private String location_admin;
	private String location_phone;
	private String location_lat;
	private String location_lng;
	
	public String getLocation_lat() {
		return location_lat;
	}
	public void setLocation_lat(String location_lat) {
		this.location_lat = location_lat;
	}
	public String getLocation_lng() {
		return location_lng;
	}
	public void setLocation_lng(String location_lng) {
		this.location_lng = location_lng;
	}
	public int getLocation_num() {
		return location_num;
	}
	public void setLocation_num(int location_num) {
		this.location_num = location_num;
	}
	public String getLocation_address1() {
		return location_address1;
	}
	public void setLocation_address1(String location_address1) {
		this.location_address1 = location_address1;
	}
	public String getLocation_address2() {
		return location_address2;
	}
	public void setLocation_address2(String location_address2) {
		this.location_address2 = location_address2;
	}
	public String getLocation_admin() {
		return location_admin;
	}
	public void setLocation_admin(String location_admin) {
		this.location_admin = location_admin;
	}
	public String getLocation_phone() {
		return location_phone;
	}
	public void setLocation_phone(String location_phone) {
		this.location_phone = location_phone;
	}
}
