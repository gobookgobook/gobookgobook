package com.gobook.sales.dto;

import java.util.Date;

public class SalesDailyDto {
	
	private int salesdaily_num;	         //일일매출관리번호(자동증가번호)
	private int salesdaily_book_num;     //도서 번호
	private int order_bunho;	         //주문번호
	private String member_id;	         //회원 아이디
	private Date salesdaily_date;	     //결제일
	private String salesdaily_book_name; //도서명
	private int salesdaily_book_cost;	 //도서원가
	private long salesdaily_book_price;	 //판매가
	private int salesdaily_quantity;	 //수량
	private int salesdaily_total;	     //판매총액(price*quantity)
	private int salesdaily_profit;	     //순이익
	
	public int getSalesdaily_num() {
		return salesdaily_num;
	}
	
	public void setSalesdaily_num(int salesdaily_num) {
		this.salesdaily_num = salesdaily_num;
	}
	
	public int getSalesdaily_book_num() {
		return salesdaily_book_num;
	}
	
	public void setSalesdaily_book_num(int salesdaily_book_num) {
		this.salesdaily_book_num = salesdaily_book_num;
	}
	
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
	
	public Date getSalesdaily_date() {
		return salesdaily_date;
	}
	
	public void setSalesdaily_date(Date salesdaily_date) {
		this.salesdaily_date = salesdaily_date;
	}
	
	public String getSalesdaily_book_name() {
		return salesdaily_book_name;
	}
	
	public void setSalesdaily_book_name(String salesdaily_book_name) {
		this.salesdaily_book_name = salesdaily_book_name;
	}
	
	public int getSalesdaily_book_cost() {
		return salesdaily_book_cost;
	}
	
	public void setSalesdaily_book_cost(int salesdaily_book_cost) {
		this.salesdaily_book_cost = salesdaily_book_cost;
	}
	
	public long getSalesdaily_book_price() {
		return salesdaily_book_price;
	}
	
	public void setSalesdaily_book_price(long salesdaily_book_price) {
		this.salesdaily_book_price = salesdaily_book_price;
	}
	
	public int getSalesdaily_quantity() {
		return salesdaily_quantity;
	}
	
	public void setSalesdaily_quantity(int salesdaily_quantity) {
		this.salesdaily_quantity = salesdaily_quantity;
	}
	
	public int getSalesdaily_total() {
		return salesdaily_total;
	}
	
	public void setSalesdaily_total(int salesdaily_total) {
		this.salesdaily_total = salesdaily_total;
	}
	
	public int getSalesdaily_profit() {
		return salesdaily_profit;
	}
	
	public void setSalesdaily_profit(int salesdaily_profit) {
		this.salesdaily_profit = salesdaily_profit;
	}
	
	


}
