package com.gobook.mybasket.dao;

import java.util.List;

import com.gobook.mybasket.dto.MyBasketDto;

public interface IMyBasketDao {
	public int getMyBasketCount();
	
	public List<MyBasketDto> getMyBasketList();
}
