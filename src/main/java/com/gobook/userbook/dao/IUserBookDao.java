package com.gobook.userbook.dao;

import java.util.HashMap;
import java.util.List;

import com.gobook.bookmanage.dto.BookDto;
import com.gobook.mybasket.dto.MyBasketDto;
import com.gobook.userbook.dto.UserBookStarDto;
import com.gobook.userorder.dto.UserOrderDto;

public interface IUserBookDao {
	
	public BookDto userBookRead(long book_num);
	public MyBasketDto myBasketSelect(long book_num);
	public int userBookBasketInsert(HashMap<String, Object> hMap);
	public int userBookSoldOutAskUpdate(long book_num);
	public int userBookGroupPurchaseAskUpdate(long book_num);
	public int starSelect(String member_id);
	public int userBookStarInsert(HashMap<String, Object> hMap);
	public int userbookstarSelect(int book_num);
	public int userbookstarCount(int book_num);
	public int bookStarUpdate(HashMap<String, Object> starMap);
	public int userBookListCount(String list);
	public List<BookDto> userBookListSelect(HashMap<String, Object> hMap);
}
