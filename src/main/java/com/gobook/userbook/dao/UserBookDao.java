package com.gobook.userbook.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.gobook.bookmanage.dto.BookDto;
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
	public int userOrderSelect(HashMap<String, Object> orderMap) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userOrderSelect", orderMap);
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
	public int userbookstarSelect(int book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userbookstarSelect", book_num);
	}

	@Override
	public int userbookstarCount(int book_num) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.userbookstarCount", book_num);
	}

	@Override
	public int bookStarUpdate(HashMap<String, Object> starMap) {
		return sqlSessionTemplate.update("dao.userBookMapper.bookStarUpdate", starMap);
	}

	@Override
	public int starSelect(String member_id) {
		return sqlSessionTemplate.selectOne("dao.userBookMapper.starSelect", member_id);
	}

	
}
