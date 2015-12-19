package com.gobook.userorder.dao;

import java.util.List;

import com.gobook.member.dto.UserCouponDto;
import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : IUserOrderDao
 * @날짜 : 2015-12-08
 * @개발자 : 김재석
 * @설명 : 주문 Dao 인터페이스
 */

public interface IUserOrderDao {
	public List<UserCouponDto> userOrderCouponListSelect(String member_id);
	
	public int userOrderPayInsert(UserOrderDto userorderDto);
	
	public int userOrderBasketDelete(String member_id);
	
	public int userOrderCouponDelete(String member_id, int order_user_coupon_num);
	
	public int userOrderPointUpdate(String member_id, int order_book_point);
	
	public int userOrderSalesBookSelect(long book_num);
	
	public int userOrderSalesInsert(UserOrderDto userOrderDto, int salesDaily_profit);
	
	public UserOrderDto salesUODSelect();
	
	public int userOrderSavingPoint(String member_id, int savingPoint);
	
	public int userOrderUpBookCount(long book_num, int book_count);
}
