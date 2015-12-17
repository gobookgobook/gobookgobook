package com.gobook.userbook.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.gobook.bookmanage.dto.BookDto;
import com.gobook.bookmanage.dto.BookGroupPurchaseDto;
import com.gobook.mybasket.dto.MyBasketDto;
import com.gobook.userbook.dto.UserBookStarDto;
import com.gobook.userorder.dto.UserOrderDto;

@Component
public class UserBookDao implements IUserBookDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * @함수이름 : userBookRead
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 도서 상세확인
	 */
	@Override
	public BookDto userBookRead(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookRead", book_num);
	}
	
	/**
	 * @함수이름 : myBasketSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 장바구니 목록
	 */
	@Override
	public MyBasketDto myBasketSelect(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.myBasketSelect", book_num);
	}
	
	/**
	 * @함수이름 : userBookBasketInsert
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 장바구니 넣기
	 */
	@Override
	public int userBookBasketInsert(HashMap<String, Object> hMap) {
		return sqlSessionTemplate.insert("dao.userBookMapper.userBookBasketInsert", hMap);
	}

	/**
	 * @함수이름 : userBookSoldOutAskUpdate
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 재입고 요청
	 */
	@Override
	public int userBookSoldOutAskUpdate(long book_num) {
		return sqlSessionTemplate.update("dao.userBookMapper.userBookSoldOutAskUpdate", book_num);
	}

	/**
	 * @함수이름 : userBookGroupPurchaseAskUpdate
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 공동구매 요청
	 */
	@Override
	public int userBookGroupPurchaseAskUpdate(long book_num) {
		return sqlSessionTemplate.update("dao.userBookMapper.userBookGroupPurchaseAskUpdate", book_num);
	}

	/**
	 * @함수이름 : userBookStarInsert
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 별점 주기
	 */
	@Override
	public int userBookStarInsert(HashMap<String, Object> hMap) {
		return sqlSessionTemplate.insert("dao.userBookMapper.userBookStarInsert", hMap);
	}

	/**
	 * @함수이름 : userbookstarSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 책학권에 별점 총갯수
	 */
	@Override
	public int userbookstarSelect(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userbookstarSelect", book_num);
	}

	/**
	 * @함수이름 : userbookstarCount
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 책한권에 유저들이 준 별점 갯수
	 */
	@Override
	public int userbookstarCount(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userbookstarCount", book_num);
	}

	/**
	 * @함수이름 : bookStarUpdate
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 책 별점 평균 수정
	 */
	@Override
	public int bookStarUpdate(HashMap<String, Object> starMap) {
		return sqlSessionTemplate.update("dao.userBookMapper.bookStarUpdate", starMap);
	}

	/**
	 * @함수이름 : starSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 사용자당 책 한권에 별점 준지 확인
	 */
	@Override
	public int starSelect(HashMap<String, Object> userStarMap) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.starSelect", userStarMap);
	}

	/**
	 * @함수이름 : userBookListCount
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 도서 목록 페이징
	 */
	@Override
	public int userBookListCount(String category) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookListCount", category);
	}

	/**
	 * @함수이름 : userBookListSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 도서 목록
	 */
	@Override
	public List<BookDto> userBookListSelect(HashMap<String, Object> hMap) {
		return sqlSessionTemplate.selectList("dao.userBookMapper.userBookListSelect", hMap);
	}

	@Override
	public int bookSerchCount(String keyword) {
		
		return sqlSessionTemplate.selectOne("dao.userBookMapper.bookSerchCount", keyword);
	}

	@Override
	public List<BookDto> bookSerchList(HashMap<String, Object> hMap) {
		
		return sqlSessionTemplate.selectList("dao.userBookMapper.bookSerchList", hMap);
	}

	/**
	 * @함수이름 : interestSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 사용자가 선택한 관신분야
	 */
	@Override
	public String interestSelect(String member_id) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.interestSelect", member_id);
	}

	/**
	 * @함수이름 : userBookInterestReadingSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 관심분야 추천
	 */
	@Override
	public List<BookDto> userBookInterestReadingSelect(String interest) {
		return sqlSessionTemplate.selectList("dao.userBookMapper.userBookInterestReadingSelect", interest);
	}

	/**
	 * @함수이름 : sujestBookList
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 성기훈
	 * @설명 : 도서검색 suggest
	 */
	@Override
	public List<String> sujestBookList(String value) {
		
		return sqlSessionTemplate.selectList("dao.userBookMapper.sujestBookList", value);
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseList
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 진행중인 공동구매 목록
	 */
	@Override
	public List<BookGroupPurchaseDto> userBookGroupPurchaseList() {
		return sqlSessionTemplate.selectList("dao.userBookMapper.userBookGroupPurchaseList");
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseRead
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 진행중인 공동구매 상세확인
	 */
	@Override
	public BookGroupPurchaseDto userBookGroupPurchaseRead(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookGroupPurchaseRead", book_num);
	}

	/**
	 * @함수이름 : userBookGroupPurchaseInsert
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 진행중인 공동구매 신청
	 */
	@Override
	public int userBookGroupPurchaseInsert(HashMap<String, Object> hMap) {
		return sqlSessionTemplate.insert("dao.userBookMapper.userBookGroupPurchaseInsert", hMap);
	}

	/**
	 * @함수이름 : userBookGroupPurchaseUpdate
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 공동구매 희망자 증가
	 */
	@Override
	public int userBookGroupPurchaseUpdate(int group_purchase_num) {
		return sqlSessionTemplate.update("dao.userBookMapper.userBookGroupPurchaseUpdate", group_purchase_num);
	}

	/**
	 * @함수이름 : userBookGroupPurchaseSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 공동 구매 신청 했는지 확인
	 */
	@Override
	public int userBookGroupPurchaseSelect(HashMap<String, Object> userMap) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookGroupPurchaseSelect", userMap);
	}
	
}
