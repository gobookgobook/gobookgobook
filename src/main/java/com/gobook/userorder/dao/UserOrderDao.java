package com.gobook.userorder.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.member.dto.UserCouponDto;
import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : UserOrderDao
 * @날짜 : 2015-12-08
 * @개발자 : 김재석
 * @설명 : 주문 Dao
 */

@Component
public class UserOrderDao implements IUserOrderDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	/**
	 * @함수이름 : userOrderCouponListSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 쿠폰 리스트
	 */
	@Override
	public List<UserCouponDto> userOrderCouponListSelect(String member_id) {
		
		return sqlSessionTemplate.selectList("dao.UserOrderMapper.userOrderCouponListSelect", member_id);
	}

	/**
	 * @함수이름 : userOrderPayInsert
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 주문 Dto 삽입
	 */
	@Override
	public int userOrderPayInsert(UserOrderDto userorderDto) {
		
		return sqlSessionTemplate.insert("dao.UserOrderMapper.userOrderPayInsert", userorderDto);
	}

	/**
	 * @함수이름 : userOrderBasketDelete
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 주문 완료 시 장바구니 내역 제거
	 */
	@Override
	public int userOrderBasketDelete(String member_id) {
		
		return sqlSessionTemplate.delete("dao.UserOrderMapper.userOrderBasketDelete", member_id);
	}

	/**
	 * @함수이름 : userOrderCouponDelete
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 쿠폰 사용 시 쿠폰 dto에서 쿠폰 제거
	 */
	@Override
	public int userOrderCouponDelete(String member_id, int order_user_coupon_num) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("member_id", member_id);
		hMap.put("order_user_coupon_num", order_user_coupon_num);
		return sqlSessionTemplate.delete("dao.UserOrderMapper.userOrderCouponDelete", hMap);
	}

	/**
	 * @함수이름 : userOrderPointUpdate
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 포인트 사용 시 포인트 감소
	 */
	@Override
	public int userOrderPointUpdate(String member_id, int order_book_point) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("member_id", member_id);
		hMap.put("order_book_point", order_book_point);
		
		return sqlSessionTemplate.update("dao.UserOrderMapper.userOrderPointUpdate", hMap);
	}

	/**
	 * @함수이름 : userOrderSalesBookSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 일일매출 삽입을 위한 책 원가 select
	 */
	@Override
	public int userOrderSalesBookSelect(long book_num) {
		
		return sqlSessionTemplate.selectOne("dao.UserOrderMapper.userOrderSalesBookSelect", book_num);
	}

	/**
	 * @함수이름 : userOrderSalesInsert
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 일일매출 insert
	 */
	@Override
	public int userOrderSalesInsert(UserOrderDto userOrderDto, int salesDaily_profit) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("order_bunho", userOrderDto.getOrder_bunho());
		hMap.put("member_id", userOrderDto.getMember_id());
		hMap.put("book_num", userOrderDto.getBook_num());
		hMap.put("salesDaily_profit", salesDaily_profit);
		
		return sqlSessionTemplate.insert("dao.UserOrderMapper.userOrderSalesInsert", hMap);
	}

	/**
	 * @함수이름 : salesUODSelect
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 일일매출 insert를 위한 주문번호 가져오기
	 */
	@Override
	public UserOrderDto salesUODSelect() {
		
		return sqlSessionTemplate.selectOne("dao.UserOrderMapper.salesUODSelect");
	}

	/**
	 * @함수이름 : userOrderSavingPoint
	 * @작성일 : 2015. 12. 19.
	 * @개발자 : 강주혁
	 * @설명 : 주문시 포인트 적립액에 따른 사용자 포인트 증가
	 */
	@Override
	public int userOrderSavingPoint(String member_id, int savingPoint) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("member_id",member_id);
		hMap.put("savingPoint",savingPoint);
		
		return sqlSessionTemplate.update("dao.UserOrderMapper.userOrderSaving",hMap);
	}

	/**
	 * @함수이름 : userOrderUpBookCount
	 * @작성일 : 2015. 12. 19.
	 * @개발자 : 강주혁
	 * @설명 : 주문시 책에서 도서 수량 감소
	 */
	@Override
	public int userOrderUpBookCount(long book_num, int book_count, int book_quantity) {
		int book_state=1;
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("book_num",book_num);
		hMap.put("book_count",book_count);
		if((book_quantity-book_count)==0) book_state=0;
		hMap.put("book_state",book_state);

		return sqlSessionTemplate.update("dao.UserOrderMapper.userOrderUpBook",hMap);
	}


}
