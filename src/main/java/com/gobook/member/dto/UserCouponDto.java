package com.gobook.member.dto;

import java.sql.Date;

/**
 * @클래스이름 : UserCouponDto
 * @날짜 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 사용자 쿠폰 DTO
 */
public class UserCouponDto {
	private int user_coupon_num;			//쿠폰 고유 번호 
	private String member_id;				//쿠폰 사용자 아이디
	private int mcoupon_num;				//관리자 쿠폰 번호
	private String user_coupon_name;		//쿠폰 이름
	private int user_coupon_discount;		//쿠폰 할인율(100이하이면 자동으로 퍼센트 계산 100이상이면 원으로 계산)
	private Date user_coupon_period;		//쿠폰 사용기간
	private String user_coupon_field;		//쿠폰 사용 범위(장르)
	private String user_coupon_content;		//쿠폰 내용
	
	public int getUser_coupon_num() {
		return user_coupon_num;
	}
	public void setUser_coupon_num(int user_coupon_num) {
		this.user_coupon_num = user_coupon_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getMcoupon_num() {
		return mcoupon_num;
	}
	public void setMcoupon_num(int mcoupon_num) {
		this.mcoupon_num = mcoupon_num;
	}
	public String getUser_coupon_name() {
		return user_coupon_name;
	}
	public void setUser_coupon_name(String user_coupon_name) {
		this.user_coupon_name = user_coupon_name;
	}
	public int getUser_coupon_discount() {
		return user_coupon_discount;
	}
	public void setUser_coupon_discount(int user_coupon_discount) {
		this.user_coupon_discount = user_coupon_discount;
	}
	public Date getUser_coupon_period() {
		return user_coupon_period;
	}
	public void setUser_coupon_period(Date user_coupon_period) {
		this.user_coupon_period = user_coupon_period;
	}
	public String getUser_coupon_field() {
		return user_coupon_field;
	}
	public void setUser_coupon_field(String user_coupon_field) {
		this.user_coupon_field = user_coupon_field;
	}
	public String getUser_coupon_content() {
		return user_coupon_content;
	}
	public void setUser_coupon_content(String user_coupon_content) {
		this.user_coupon_content = user_coupon_content;
	}
}
