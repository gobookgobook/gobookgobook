package com.gobook.sales.dto;

import java.util.Date;

/**
 * @클래스이름 : SalesMonthlyDto
 * @날짜 : 2015. 12. 23.
 * @개발자 : 황규성
 * @설명 : 월별매출 Dto
 */
public class SalesMonthlyDto {
	private int salesm_num;							// 월별매출관리번호
	private long book_num;							// 도서 번호
	private Date salesmonthly_date;					// 일일 정산 날짜
	private int salesmonthly_daily_sale;			// 일일 판매 금액
	private int salesmonthly_daily_profit;			// 일일 순이익
	private String salesmonthly_order_bookname;		// 월간 입고 도서 제목
	private int salesmonthly_order_quantity;		// 입고량
	private int salesmonthly_order_cost;			// 입고 개당 가격
	private int salesmonthly_order_totalprice;		// 입고 총액
	
	public int getSalesm_num() {
		return salesm_num;
	}
	
	public void setSalesm_num(int salesm_num) {
		this.salesm_num = salesm_num;
	}
	
	public long getBook_num() {
		return book_num;
	}
	
	public void setBook_num(long book_num) {
		this.book_num = book_num;
	}
	
	public Date getSalesmonthly_date() {
		return salesmonthly_date;
	}
	
	public void setSalesmonthly_date(Date salesmonthly_date) {
		this.salesmonthly_date = salesmonthly_date;
	}
	
	public int getSalesmonthly_daily_sale() {
		return salesmonthly_daily_sale;
	}
	
	public void setSalesmonthly_daily_sale(int salesmonthly_daily_sale) {
		this.salesmonthly_daily_sale = salesmonthly_daily_sale;
	}
	
	public int getSalesmonthly_daily_profit() {
		return salesmonthly_daily_profit;
	}
	
	public void setSalesmonthly_daily_profit(int salesmonthly_daily_profit) {
		this.salesmonthly_daily_profit = salesmonthly_daily_profit;
	}
	
	public String getSalesmonthly_order_bookname() {
		return salesmonthly_order_bookname;
	}
	
	public void setSalesmonthly_order_bookname(String salesmonthly_order_bookname) {
		this.salesmonthly_order_bookname = salesmonthly_order_bookname;
	}
	
	public int getSalesmonthly_order_quantity() {
		return salesmonthly_order_quantity;
	}
	
	public void setSalesmonthly_order_quantity(int salesmonthly_order_quantity) {
		this.salesmonthly_order_quantity = salesmonthly_order_quantity;
	}
	
	public int getSalesmonthly_order_cost() {
		return salesmonthly_order_cost;
	}
	
	public void setSalesmonthly_order_cost(int salesmonthly_order_cost) {
		this.salesmonthly_order_cost = salesmonthly_order_cost;
	}
	
	public int getSalesmonthly_order_totalprice() {
		return salesmonthly_order_totalprice;
	}
	
	public void setSalesmonthly_order_totalprice(int salesmonthly_order_totalprice) {
		this.salesmonthly_order_totalprice = salesmonthly_order_totalprice;
	}

	@Override
	public String toString() {
		return "SalesMonthlyDto [salesm_num=" + salesm_num + ", book_num=" + book_num
				+ ", salesmonthly_date=" + salesmonthly_date + ", salesmonthly_daily_sale=" + salesmonthly_daily_sale
				+ ", salesmonthly_daily_profit=" + salesmonthly_daily_profit + ", salesmonthly_order_bookname="
				+ salesmonthly_order_bookname + ", salesmonthly_order_quantity=" + salesmonthly_order_quantity
				+ ", salesmonthly_order_cost=" + salesmonthly_order_cost + ", salesmonthly_order_totalprice="
				+ salesmonthly_order_totalprice + "]";
	}
}