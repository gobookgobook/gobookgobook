package com.gobook.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.gobook.bookmanage.dto.BookDto;
import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.ZipcodeDto;
import com.gobook.userorder.dto.UserOrderDto;

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
		int count=0;
		
		TransactionDefinition definition=new DefaultTransactionDefinition();
		TransactionStatus status=transactionManager.getTransaction(definition);
		
		try{
			count+=sqlSessionTemplate.insert("dao.memberMapper.memberInsert", memberDto);
			count+=sqlSessionTemplate.insert("dao.memberMapper.memberNewCouponInsert", memberDto);
			
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
		}	
		
		return count;
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
		
		int count=0;
		
		TransactionDefinition definition=new DefaultTransactionDefinition();
		TransactionStatus status=transactionManager.getTransaction(definition);
		
		String tempBook = sqlSessionTemplate.selectOne("dao.memberMapper.memberUserGPSelect",id);
		int tempBookNum=0;
		if(tempBook!=null){
			tempBookNum=Integer.parseInt(tempBook);
		}
		try{
			sqlSessionTemplate.delete("dao.memberMapper.memberUserCouponDelete",id);
			sqlSessionTemplate.delete("dao.memberMapper.memberMyBasketDelete",id);
			sqlSessionTemplate.delete("dao.memberMapper.memberUserGPDelete",id);
			if(tempBookNum >0){
				sqlSessionTemplate.update("dao.memberMapper.memberGroupPurchaseDelete",tempBook);
			}
			
			count=sqlSessionTemplate.update("dao.memberMapper.memberDelete", hMap);
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
		}	
		
		return count;
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

	/**
	 * @함수이름 : memberUpdate
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 강주혁
	 * @설명 : 회원정보 Update
	 */
	@Override
	public int memberUpdate(MemberDto memberDto) {
		return sqlSessionTemplate.update("dao.memberMapper.memberUpdate", memberDto);
	}

	/**
	 * @함수이름 : memberDeleteCouponDate
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 강주혁
	 * @설명 : 기한이 지난 쿠폰 삭제
	 */
	@Override
	public int memberDeleteCouponDate(String loginId) {
		return sqlSessionTemplate.delete("dao.memberMapper.memberDeleteCouponDate",loginId);
	}

	/**
	 * @함수이름 : memberDeleteBasketDate
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 강주혁
	 * @설명 : 기한이 지난 장바구니 삭제
	 */
	@Override
	public int memberDeleteBasketDate(String loginId) {
		return sqlSessionTemplate.delete("dao.memberMapper.memberDeleteBasketDate",loginId);
	}
	
	/**
	 * @함수이름 : userBookBestSeller
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 오주석
	 * @설명 : 베스트 셀러
	 */
	@Override
	public List<BookDto> userBookBestSeller() {
		return sqlSessionTemplate.selectList("dao.memberMapper.userBookBestSeller");
	}
}
