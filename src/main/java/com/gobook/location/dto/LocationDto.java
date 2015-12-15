package com.gobook.location.dto;

public class LocationDto {
	private int location_num;
	private String location_address;
	private String location_admin;
	private String location_phone;
	
	public int getLocation_num() {
		return location_num;
	}
	public void setLocation_num(int location_num) {
		this.location_num = location_num;
	}
	public String getLocation_address() {
		return location_address;
	}
	public void setLocation_address(String location_address) {
		this.location_address = location_address;
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
