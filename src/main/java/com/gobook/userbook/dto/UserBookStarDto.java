package com.gobook.userbook.dto;

public class UserBookStarDto {
	private int userbookstar_num;		//사용자 별점 고유번호
	private String member_id;			//사용자 아이디
	private long book_num;				//책 고유번호
	private int userbookstar_star;		//사용자 별점
	public int getUserbookstar_num() {
		return userbookstar_num;
	}
	public void setUserbookstar_num(int userbookstar_num) {
		this.userbookstar_num = userbookstar_num;
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
	public int getUserbookstar_star() {
		return userbookstar_star;
	}
	public void setUserbookstar_star(int userbookstar_star) {
		this.userbookstar_star = userbookstar_star;
	}

}
