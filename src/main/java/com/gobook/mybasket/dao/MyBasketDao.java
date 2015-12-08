package com.gobook.mybasket.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.mybasket.dto.MyBasketDto;

@Component
public class MyBasketDao implements IMyBasketDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int getMyBasketCount() {
		return sqlSessionTemplate.selectOne("dao.myBasketMapper.getMyBasketCount");
	}

	@Override
	public List<MyBasketDto> getMyBasketList() {
		return sqlSessionTemplate.selectList("dao.myBasketMapper.getMyBasketList");
	}
}
