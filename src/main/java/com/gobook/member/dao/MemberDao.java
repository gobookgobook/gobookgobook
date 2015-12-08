package com.gobook.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.ZipcodeDto;

/**
 * @클래스이름 : MemberDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 회원관리 Dao
 */
@Component
public class MemberDao implements IMemberDao{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	/**
	 * @함수이름 : zipcode
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 우편번호
	 */
	@Override
	public List<ZipcodeDto> zipcode(String dong) {
		return sqlSessionTemplate.selectList("dao.memberMapper.memberZipcode", dong);
	}

	/**
	 * @함수이름 : memberIdCheck
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : ID 중복체크
	 */
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

	/**
	 * @함수이름 : memberInsert
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원가입
	 */
	@Override
	public int memberInsert(MemberDto memberDto) {
		return sqlSessionTemplate.insert("dao.memberMapper.memberInsert", memberDto);
	}

	/**
	 * @함수이름 : memberLogin
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원로그인
	 */
	@Override
	public String memberLogin(String id, String password) {
		String value=null;
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("id", id);
		hMap.put("password", password);
		
		try{
			value=sqlSessionTemplate.selectOne("dao.memberMapper.memberLogin", hMap);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return value;
	}

	/**
	 * @함수이름 : memberDelete
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원탈퇴
	 */
	@Override
	public int memberDelete(String id, String password) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("id", id);
		hMap.put("password", password);
		
		return sqlSessionTemplate.delete("dao.memberMapper.memberDelete", hMap);
	}

	/**
	 * @함수이름 : memberSelect
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원정보 검색
	 */
	@Override
	public MemberDto memberSelect(String id) {
		MemberDto memberDto=null;
		
		try{
			memberDto=sqlSessionTemplate.selectOne("dao.memberMapper.memberSelect", id);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return memberDto;
	}
}
