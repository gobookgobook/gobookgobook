package com.gobook.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.member.dto.UserCouponDto;
import com.gobook.userorder.dto.UserOrderDto;

@Component
public class MyPageDao implements IMyPageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<UserOrderDto> myPageOrderListSelect(String member_id) {

		return sqlSessionTemplate.selectList("dao.myPageMapper.myPageOrderListSelect", member_id);
	}

	@Override
	public int myPageOrderCount() {
		
		return sqlSessionTemplate.selectOne("dao.myPageMapper.myPageOrderCount");
	}

	@Override
	public List<UserOrderDto> myPageHistoryListSelect(int startRow, int endRow, String member_id) {

		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("member_id", member_id);
		
		return sqlSessionTemplate.selectList("dao.myPageMapper.myPageHistoryListSelect", hMap);
	}

	@Override
	public List<UserCouponDto> myPageCouponSelect(String member_id) {

		return sqlSessionTemplate.selectList("dao.myPageMapper.myPageCouponSelect", member_id);
	}
	
}
