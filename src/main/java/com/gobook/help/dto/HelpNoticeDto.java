package com.gobook.help.dto;

import java.util.Date;

/**
 * @클래스이름 : HelpNoticeDto
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 고객센터 공지사항 Dto
 */
public class HelpNoticeDto {
	private int helpnotice_num;
	private String helpnotice_subject;
	private String helpnotice_content;
	private Date helpnotice_writeDate;
	
	public int getHelpnotice_num() {
		return helpnotice_num;
	}
	public void setHelpnotice_num(int helpnotice_num) {
		this.helpnotice_num = helpnotice_num;
	}
	public String getHelpnotice_subject() {
		return helpnotice_subject;
	}
	public void setHelpnotice_subject(String helpnotice_subject) {
		this.helpnotice_subject = helpnotice_subject;
	}
	public String getHelpnotice_content() {
		return helpnotice_content;
	}
	public void setHelpnotice_content(String helpnotice_content) {
		this.helpnotice_content = helpnotice_content;
	}
	public Date getHelpnotice_writeDate() {
		return helpnotice_writeDate;
	}
	public void setHelpnotice_writeDate(Date helpnotice_writeDate) {
		this.helpnotice_writeDate = helpnotice_writeDate;
	}
	
	

}
