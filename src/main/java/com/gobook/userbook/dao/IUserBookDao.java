package com.gobook.userbook.dao;

import java.util.HashMap;
import java.util.List;

import com.gobook.bookmanage.dto.BookDto;
import com.gobook.bookmanage.dto.BookGroupPurchaseDto;
import com.gobook.mybasket.dto.MyBasketDto;
import com.gobook.userbook.dto.UserBookStarDto;
import com.gobook.userorder.dto.UserOrderDto;

public interface IUserBookDao {
	
	public BookDto userBookRead(long book_num);
	public MyBasketDto myBasketSelect(HashMap<String, Object> starMap);
	public int userBookBasketInsert(HashMap<String, Object> hMap);
	public int userBookSoldOutAskUpdate(long book_num);
	public int userBookGroupPurchaseAskUpdate(long book_num);
	public int starSelect(HashMap<String, Object> userStarMap);
	public int userBookStarInsert(HashMap<String, Object> hMap);
	public int userbookstarSelect(long book_num);
	public int userbookstarCount(long book_num);
	public int bookStarUpdate(HashMap<String, Object> starMap);
	public int userBookListCount(String category);
	public List<BookDto> userBookListSelect(HashMap<String, Object> hMap);
	public int bookSerchCount(String keyword);
	public List<BookDto> bookSerchList(HashMap<String, Object> hMap);
	public String interestSelect(String member_id);
	public List<BookDto> userBookInterestReadingSelect(String interest);
	public List<String> sujestBookList(String value);
	public List<BookGroupPurchaseDto> userBookGroupPurchaseList();
	public BookGroupPurchaseDto userBookGroupPurchaseRead(long book_num);
	public int userBookGroupPurchaseSelect(HashMap<String, Object> userMap);
	public int userBookGroupPurchaseInsert(HashMap<String, Object> hMap);
	public int userBookGroupPurchaseUpdate(int group_purchase_num);
	public BookDto userBookPreview(long book_num);
	public int specialsBookCount();
	public List<BookDto> specialsBookSelect(HashMap<String, Object> hMap);
}
