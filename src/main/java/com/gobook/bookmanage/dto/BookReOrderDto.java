package com.gobook.bookmanage.dto;

import java.util.Date;

public class BookReOrderDto {
	private int reorder_num;
	private String book_name;
	private int reorder_quantity;
	private long book_num;
	private Date reorder_date;
	private int book_cost;
	private int reorder_total_price;
	
	public int getReorder_total_price() {
		return reorder_total_price;
	}
	public void setReorder_total_price(int reorder_total_price) {
		this.reorder_total_price = reorder_total_price;
	}
	public int getReorder_num() {
		return reorder_num;
	}
	public void setReorder_num(int reorder_num) {
		this.reorder_num = reorder_num;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getReorder_quantity() {
		return reorder_quantity;
	}
	public void setReorder_quantity(int reorder_quantity) {
		this.reorder_quantity = reorder_quantity;
	}
	public long getBook_num() {
		return book_num;
	}
	public void setBook_num(long book_num) {
		this.book_num = book_num;
	}
	public Date getReorder_date() {
		return reorder_date;
	}
	public void setReorder_date(Date reorder_date) {
		this.reorder_date = reorder_date;
	}
	public int getBook_cost() {
		return book_cost;
	}
	public void setBook_cost(int book_cost) {
		this.book_cost = book_cost;
	}
}
