package com.gobook.member.dao;

import java.util.List;

import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.ZipcodeDto;

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
	public String memberLogin(String id, String password);
	public int memberDelete(String id, String password);
	public MemberDto memberSelect(String id);
	public int memberUpdate(MemberDto memberDto);
	public int memberDeleteCouponDate(String loginId);
	public int memberDeleteBasketDate(String loginId);
}
