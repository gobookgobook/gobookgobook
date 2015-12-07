package com.gobook.bookmanage.dao;

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
}
