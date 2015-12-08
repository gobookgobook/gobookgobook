package com.gobook.member.dto;

/**
 * @클래스이름 : ZipcodeDto
 * @날짜 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 우편번호 DTO
 */
public class ZipcodeDto {
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String ri;
	private String bunji;
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getRi() {
		return ri;
	}
	public void setRi(String ri) {
		this.ri = ri;
	}
	public String getBunji() {
		return bunji;
	}
	public void setBunji(String bunji) {
		this.bunji = bunji;
	}
}
