package com.gobook.member.dto;

public class UserGP {
	private int user_gp_num;
	private int group_purchase_num;
	private long book_num;
	private String member_id;
	
	public int getUser_gp_num() {
		return user_gp_num;
	}
	public void setUser_gp_num(int user_gp_num) {
		this.user_gp_num = user_gp_num;
	}
	public int getGroup_purchase_num() {
		return group_purchase_num;
	}
	public void setGroup_purchase_num(int group_purchase_num) {
		this.group_purchase_num = group_purchase_num;
	}
	public long getBook_num() {
		return book_num;
	}
	public void setBook_num(long book_num) {
		this.book_num = book_num;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	
}
