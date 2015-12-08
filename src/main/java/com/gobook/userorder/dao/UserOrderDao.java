package com.gobook.userorder.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : UserOrderDao
 * @날짜 : 2015-12-08
 * @개발자 : 김재석
 * @설명 : 
 */

@Component
public class UserOrderDao implements IUserOrderDao{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public int getUserOrderCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("dao.UserOrderMapper.getUserOrderCount");
	}

	@Override
	public List<UserOrderDto> getUserOrderList() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("dao.UserOrderMapper.getUserOrderList");
	}

	

}
