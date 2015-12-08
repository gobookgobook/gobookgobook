package com.gobook.userorder.dao;

import java.util.List;

import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : IUserOrderDao
 * @날짜 : 2015-12-08
 * @개발자 : 김재석
 * @설명 : 인터페이스
 */

public interface IUserOrderDao {
  
	public int userOrderCount(String member_id);
	
	public List<UserOrderDto> userOrderList(String member_id);
	
	public int userOrderListOk(UserOrderDto userorderDto);
}
