package com.gobook.member.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.member.dto.MemberDto;
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

	@Override
	public int memberIdCheck(String id) {
		int value=0;
		
		try{
			String checkId=sqlSessionTemplate.selectOne("dao.memberMapper.memberIdCheck", id);
			if(checkId !=null) value=1;
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return value;
	}

	@Override
	public int memberInsert(MemberDto memberDto) {
		return sqlSessionTemplate.insert("dao.memberMapper.memberInsert", memberDto);
	}
}
