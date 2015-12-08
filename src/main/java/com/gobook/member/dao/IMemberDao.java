package com.gobook.member.dao;

import java.util.List;

import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.ZipcodeDto;

public interface IMemberDao {
	public List<ZipcodeDto> zipcode(String dong);
	public int memberIdCheck(String id);
	public int memberInsert(MemberDto memberDto);
}
