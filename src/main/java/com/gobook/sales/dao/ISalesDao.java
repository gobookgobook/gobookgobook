package com.gobook.sales.dao;

import java.util.List;

import com.gobook.sales.dto.SalesDailyDto;

/**
 * @클래스이름 : ISalesDao
 * @날짜 : 2015. 12. 11.
 * @개발자 : 황규성
 * @설명 : 매출 Dao 인터페이스
 */
public interface ISalesDao {
	public int salesDailyCount();
	
	public List<SalesDailyDto> salesDailyList();
}
