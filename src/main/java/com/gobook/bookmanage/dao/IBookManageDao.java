package com.gobook.bookmanage.dao;

import java.util.HashMap;
import java.util.List;

import com.gobook.bookmanage.dto.*;

public interface IBookManageDao {
	public int bookInsert(BookDto bookDto);
	public int bookStockCount();
	public List<BookDto> bookList(HashMap<String, Integer> hMap);
	public BookDto bookInfo(long book_num);
	public int bookStockUpdate(BookDto bookDto, int reorder_quantity);
	public int bookReOrderListCount();
	public List<BookReOrderDto> bookReOrderList(HashMap<String, Integer> hMap);
	public int bookReOrderCount();
	public List<BookDto> bookReOrderCountList(HashMap<String, Integer> hMap);
	public int bookGroupPurchaseCount();
	public List<BookDto> bookGroupPurchaseCountList(HashMap<String, Integer> hMap);
	public int bookSoldOutCount();
	public List<BookDto> bookSoldOutList(HashMap<String, Integer> hMap);
}
