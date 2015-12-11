package com.gobook.event.dto;

import java.util.Date;
import java.util.HashMap;

public class EventDto {
	
	private int event_bunho;           //이벤트 고유번호
	private String event_name;         //이벤트 명
	private Date event_start_period;   //이벤트 시작 기간
	private Date event_end_period;     //이벤트 종료 기간
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
	
	public Date getEvent_start_period() {
		return event_start_period;
	}
	
	public void setEvent_start_period(Date event_start_period) {
		this.event_start_period = event_start_period;
	}
	
	public Date getEvent_end_period() {
		return event_end_period;
	}

	public void setEvent_end_period(Date event_end_period) {
		this.event_end_period = event_end_period;
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
