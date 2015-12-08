package com.gobook.mybasket.dto;

/**
 * @클래스이름 : MyBasketDto
 * @날짜 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니 Dto
 */
public class MyBasketDto {
	private int basket_num;				// 장바구니번호
	private String member_id;			// 사용자아이디
	private long book_num;				// 책 고유번호
	private String basket_book_name;	// 도서명
	private int basket_book_price;		// 도서 가격
	private int basket_total_price;		// 총가격(가격*수량)
	private int basket_quantity;		// 수량
	private int basket_book_state;		// 구매가능여부
	
	public int getBasket_num() {
		return basket_num;
	}
	
	public void setBasket_num(int basket_num) {
		this.basket_num = basket_num;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public long getBook_num() {
		return book_num;
	}
	
	public void setBook_num(long book_num) {
		this.book_num = book_num;
	}
	
	public String getBasket_book_name() {
		return basket_book_name;
	}
	
	public void setBasket_book_name(String basket_book_name) {
		this.basket_book_name = basket_book_name;
	}
	
	public int getBasket_book_price() {
		return basket_book_price;
	}
	
	public void setBasket_book_price(int basket_book_price) {
		this.basket_book_price = basket_book_price;
	}
	
	public int getBasket_total_price() {
		return basket_total_price;
	}
	
	public void setBasket_total_price(int basket_total_price) {
		this.basket_total_price = basket_total_price;
	}
	
	public int getBasket_quantity() {
		return basket_quantity;
	}
	
	public void setBasket_quantity(int basket_quantity) {
		this.basket_quantity = basket_quantity;
	}
	
	public int getBasket_book_state() {
		return basket_book_state;
	}
	
	public void setBasket_book_state(int basket_book_state) {
		this.basket_book_state = basket_book_state;
	}
}