package com.gobook.bookmanage.dao;

import com.gobook.bookmanage.dto.BookDto;

public interface IBookManageDao {
	public int bookInsert(BookDto bookDto);
}
