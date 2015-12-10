package com.gobook.event.dto;

import java.util.Date;

public class EventDto {
	
	private int event_bunho;           //이벤트 고유번호
	private String event_name;         //이벤트 명
	private Date event_period;         //이벤트 기간
	private String event_Content;      //이벤트 내용
	private String event_file_name;    //이벤트 사진 이름
	private String event_file_path;    //이벤트 사진 경로
	private long event_file_size;      //이벤트 사진 사이즈
	
	public int getEvent_bunho() {
		return event_bunho;
	}
	
	public void setEvent_bunho(int event_bunho) {
		this.event_bunho = event_bunho;
	}
	
	public String getEvent_name() {
		return event_name;
	}
	
	public void setEvent_name(String event_name) {
		this.event_name = event_name;
	}
	
	public Date getEvent_period() {
		return event_period;
	}
	
	public void setEvent_period(Date event_period) {
		this.event_period = event_period;
	}
	
	public String getEvent_Content() {
		return event_Content;
	}
	
	public void setEvent_Content(String event_Content) {
		this.event_Content = event_Content;
	}
	
	public String getEvent_file_name() {
		return event_file_name;
	}
	
	public void setEvent_file_name(String event_file_name) {
		this.event_file_name = event_file_name;
	}
	
	public String getEvent_file_path() {
		return event_file_path;
	}
	
	public void setEvent_file_path(String event_file_path) {
		this.event_file_path = event_file_path;
	}
	
	public long getEvent_file_size() {
		return event_file_size;
	}
	
	public void setEvent_file_size(long event_file_size) {
		this.event_file_size = event_file_size;
	}

	
	
	
}
