package com.gobook.userorder.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

@Component
public class UserOrderDao implements IUserOrderDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public void userOrderListSelect() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userOrderMemberSelect() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userOrderMemberCoupon() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userOrderPayInsert() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void userOrderCouponListSelect() {
		// TODO Auto-generated method stub
		
	}

}
