package com.gobook.bookmanage.dto;

import java.util.Date;

public class BookGroupPurchaseDto {
	private int gp_num;
	private long book_num;
	private String book_name;
	private int book_cost;
	private int book_price;
	private int book_quantity;
	private int group_purchase_price;
	private int group_purchase_min_count;
	private int group_purchase_max_count;
	private int group_purchase_count;
	private Date group_purchase_date;
	private int group_purchase_state;
	private String book_writer;
	private String book_publisher;
	private Date book_publish_date;
	private String book_index;
	private String book_summary;
	
	public String getBook_writer() {
		return book_writer;
	}
	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}
	public String getBook_publisher() {
		return book_publisher;
	}
	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}
	public Date getBook_publish_date() {
		return book_publish_date;
	}
	public void setBook_publish_date(Date book_publish_date) {
		this.book_publish_date = book_publish_date;
	}
	public String getBook_index() {
		return book_index;
	}
	public void setBook_index(String book_index) {
		this.book_index = book_index;
	}
	public String getBook_summary() {
		return book_summary;
	}
	public void setBook_summary(String book_summary) {
		this.book_summary = book_summary;
	}
	public int getBook_cost() {
		return book_cost;
	}
	public void setBook_cost(int book_cost) {
		this.book_cost = book_cost;
	}
	public int getBook_price() {
		return book_price;
	}
	public void setBook_price(int book_price) {
		this.book_price = book_price;
	}
	public int getBook_quantity() {
		return book_quantity;
	}
	public void setBook_quantity(int book_quantity) {
		this.book_quantity = book_quantity;
	}
	public int getGp_num() {
		return gp_num;
	}
	public void setGp_num(int gp_num) {
		this.gp_num = gp_num;
	}
	public long getBook_num() {
		return book_num;
	}
	public void setBook_num(long book_num) {
		this.book_num = book_num;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getGroup_purchase_price() {
		return group_purchase_price;
	}
	public void setGroup_purchase_price(int group_purchase_price) {
		this.group_purchase_price = group_purchase_price;
	}
	public int getGroup_purchase_min_count() {
		return group_purchase_min_count;
	}
	public void setGroup_purchase_min_count(int group_purchase_min_count) {
		this.group_purchase_min_count = group_purchase_min_count;
	}
	public int getGroup_purchase_max_count() {
		return group_purchase_max_count;
	}
	public void setGroup_purchase_max_count(int group_purchase_max_count) {
		this.group_purchase_max_count = group_purchase_max_count;
	}
	public int getGroup_purchase_count() {
		return group_purchase_count;
	}
	public void setGroup_purchase_count(int group_purchase_count) {
		this.group_purchase_count = group_purchase_count;
	}
	public Date getGroup_purchase_date() {
		return group_purchase_date;
	}
	public void setGroup_purchase_date(Date group_purchase_date) {
		this.group_purchase_date = group_purchase_date;
	}
	public int getGroup_purchase_state() {
		return group_purchase_state;
	}
	public void setGroup_purchase_state(int group_purchase_state) {
		this.group_purchase_state = group_purchase_state;
	}
}
