package com.gobook.member.dao;

import java.util.List;

import com.gobook.bookmanage.dto.BookDto;
import com.gobook.event.dto.EventDto;
import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.ZipcodeDto;
import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : IMemberDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 회원관리 Dao Interface
 */
public interface IMemberDao {
	public List<ZipcodeDto> zipcode(String dong);
	public int memberIdCheck(String id);
	public int memberInsert(MemberDto memberDto);
	public MemberDto memberLogin(String id, String password);
	public int memberDelete(String id, String password);
	public MemberDto memberSelect(String id);
	public int memberUpdate(MemberDto memberDto);
	public int memberDeleteCouponDate(String loginId);
	public int memberDeleteBasketDate(String loginId);
	public List<BookDto> userBookBestSeller();
	public List<EventDto> eventListSelect();
	public List<BookDto> newBookSelect();
}
