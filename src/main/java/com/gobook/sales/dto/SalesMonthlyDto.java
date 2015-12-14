package com.gobook.sales.dto;

import java.util.Date;

public class SalesMonthlyDto {
	private int salesmonthly_num;					// 월간매출관리번호
	private Date salesmonthly_date;					// 일일 정산 날짜
	private int salesmonthly_daily_sale;			// 일일 판매 금액
	private long book_num;							// 도서 번호
	private String salesmonthly_order_bookname;		// 월간 입고 도서 제목
	private int salesmonthly_order_quantity;		// 입고량
	private int salesmonthly_order_cost;			// 입고 개당 가격
	private int salesmonthly_order_totalprice;		// 입고 총액

	
}
