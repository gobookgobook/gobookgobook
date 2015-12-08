package com.gobook.mybasket.dao;

import java.util.List;

import com.gobook.mybasket.dto.MyBasketDto;

/**
 * @클래스이름 : IMyBasketDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니 Dao 인터페이스
 */
public interface IMyBasketDao {
	public int myBasketCount(String member_id);
	
	public List<MyBasketDto> myBasketList(String member_id);
	
	public int myBasketDelete(int basket_num);
}
