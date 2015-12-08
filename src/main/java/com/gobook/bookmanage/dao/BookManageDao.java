package com.gobook.bookmanage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.bookmanage.dto.BookDto;

@Component
public class BookManageDao implements IBookManageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int bookInsert(BookDto bookDto) {
		
		return sqlSessionTemplate.insert("dao.bookmanageMapper.bookInsert", bookDto);
	}

	@Override
	public int bookStockCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookStockCount");
	}

	@Override
	public List<BookDto> bookSoldOutList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookSoldOutList", hMap);
	}

	@Override
	public BookDto bookInfo(long book_num) {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookInfo", book_num);
	}
}
