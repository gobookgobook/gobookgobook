package com.gobook.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.member.dto.ZipcodeDto;

@Component
public class MemberDao implements IMemberDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public List<ZipcodeDto> zipcode(String dong) {
		return sqlSessionTemplate.selectList("dao.memberMapper.memberZipcode", dong);
	}
}
