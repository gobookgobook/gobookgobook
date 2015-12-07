package com.gobook.member.dao;

import java.util.List;

import com.gobook.member.dto.ZipcodeDto;

public interface IMemberDao {
	public List<ZipcodeDto> zipcode(String dong);
}
