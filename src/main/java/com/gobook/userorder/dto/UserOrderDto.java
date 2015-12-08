package com.gobook.userorder.dto;

import java.util.Date;

/**
 * @클래스이름 : UserOrderDto
 * @날짜 : 2015-12-08
 * @개발자 : 김재석
 * @설명 : 
 */

public class UserOrderDto {
	
	private int order_bunho;	            //주문번호
	private String member_id;	            //주문한 사람 ID
	private String order_book_name;	        //책이름
	private int order_book_price;	        //책가격
	private int order_book_count;	        //수량
	private String order_zipcode;	        //우편번호
	private String order_book_user_address1;//배송지주소
	private String order_book_user_address2;//상세주소
	private int order_book_point;	        //사용가능한 포인트
	private String order_user_coupon_name;	//쿠폰 이름
	private int order_user_coupon_discount;	//쿠폰 할인율(100이하이면 자동으로 퍼센트 계산 100이상이면 원으로 계산)
	private String order_book_user_number;	//전화번호
	private int order_book_state; 	        //주문상태
	private Date order_date;	            //주문 날짜
	private String order_book_charge;	    //결재내역(휴대폰,무통장,신용카드)
	
	
	public int getOrder_bunho() {
		return order_bunho;
	}
	
	public void setOrder_bunho(int order_bunho) {
		this.order_bunho = order_bunho;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getOrder_book_name() {
		return order_book_name;
	}
	
	public void setOrder_book_name(String order_book_name) {
		this.order_book_name = order_book_name;
	}
	
	public int getOrder_book_price() {
		return order_book_price;
	}
	
	public void setOrder_book_price(int order_book_price) {
		this.order_book_price = order_book_price;
	}
	
	public int getOrder_book_count() {
		return order_book_count;
	}
	
	public void setOrder_book_count(int order_book_count) {
		this.order_book_count = order_book_count;
	}
	
	public String getOrder_zipcode() {
		return order_zipcode;
	}
	
	public void setOrder_zipcode(String order_zipcode) {
		this.order_zipcode = order_zipcode;
	}
	
	public String getOrder_book_user_address1() {
		return order_book_user_address1;
	}
	
	public void setOrder_book_user_address1(String order_book_user_address1) {
		this.order_book_user_address1 = order_book_user_address1;
	}
	
	public String getOrder_book_user_address2() {
		return order_book_user_address2;
	}
	
	public void setOrder_book_user_address2(String order_book_user_address2) {
		this.order_book_user_address2 = order_book_user_address2;
	}
	
	public int getOrder_book_point() {
		return order_book_point;
	}
	
	public void setOrder_book_point(int order_book_point) {
		this.order_book_point = order_book_point;
	}
	
	public String getOrder_user_coupon_name() {
		return order_user_coupon_name;
	}
	
	public void setOrder_user_coupon_name(String order_user_coupon_name) {
		this.order_user_coupon_name = order_user_coupon_name;
	}
	
	public int getOrder_user_coupon_discount() {
		return order_user_coupon_discount;
	}
	
	public void setOrder_user_coupon_discount(int order_user_coupon_discount) {
		this.order_user_coupon_discount = order_user_coupon_discount;
	}
	
	public String getOrder_book_user_number() {
		return order_book_user_number;
	}
	
	public void setOrder_book_user_number(String order_book_user_number) {
		this.order_book_user_number = order_book_user_number;
	}
	
	public int getOrder_book_state() {
		return order_book_state;
	}
	
	public void setOrder_book_state(int order_book_state) {
		this.order_book_state = order_book_state;
	}
	
	public Date getOrder_date() {
		return order_date;
	}
	
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
	public String getOrder_book_charge() {
		return order_book_charge;
	}
	
	public void setOrder_book_charge(String order_book_charge) {
		this.order_book_charge = order_book_charge;
	}
	
	


}
