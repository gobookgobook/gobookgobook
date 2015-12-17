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

	@Override
	public BookDto userBookRead(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookRead", book_num);
	}
	
	@Override
	public MyBasketDto myBasketSelect(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.myBasketSelect", book_num);
	}
	
	@Override
	public int userBookBasketInsert(HashMap<String, Object> hMap) {
		return sqlSessionTemplate.insert("dao.userBookMapper.userBookBasketInsert", hMap);
	}

	@Override
	public int userBookSoldOutAskUpdate(long book_num) {
		return sqlSessionTemplate.update("dao.userBookMapper.userBookSoldOutAskUpdate", book_num);
	}

	@Override
	public int userBookGroupPurchaseAskUpdate(long book_num) {
		return sqlSessionTemplate.update("dao.userBookMapper.userBookGroupPurchaseAskUpdate", book_num);
	}

	@Override
	public int userBookStarInsert(HashMap<String, Object> hMap) {
		return sqlSessionTemplate.insert("dao.userBookMapper.userBookStarInsert", hMap);
	}

	@Override
	public int userbookstarSelect(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userbookstarSelect", book_num);
	}

	@Override
	public int userbookstarCount(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userbookstarCount", book_num);
	}

	@Override
	public int bookStarUpdate(HashMap<String, Object> starMap) {
		return sqlSessionTemplate.update("dao.userBookMapper.bookStarUpdate", starMap);
	}

	@Override
	public int starSelect(HashMap<String, Object> userStarMap) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.starSelect", userStarMap);
	}

	@Override
	public int userBookListCount(String category) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookListCount", category);
	}

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

	@Override
	public String interestSelect(String member_id) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.interestSelect", member_id);
	}

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
	 * @설명 : 
	 */
	@Override
	public List<BookGroupPurchaseDto> userBookGroupPurchaseList() {
		return sqlSessionTemplate.selectList("dao.userBookMapper.userBookGroupPurchaseList");
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseRead
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public BookGroupPurchaseDto userBookGroupPurchaseRead(long book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookGroupPurchaseRead", book_num);
	}

	@Override
	public int userBookGroupPurchaseInsert(HashMap<String, Object> hMap) {
		return sqlSessionTemplate.insert("dao.userBookMapper.userBookGroupPurchaseInsert", hMap);
	}

	@Override
	public int userBookGroupPurchaseUpdate(int group_purchase_num) {
		return sqlSessionTemplate.update("dao.userBookMapper.userBookGroupPurchaseUpdate", group_purchase_num);
	}

	@Override
	public int userBookGroupPurchaseSelect(HashMap<String, Object> userMap) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userBookGroupPurchaseSelect", userMap);
	}
	
}
