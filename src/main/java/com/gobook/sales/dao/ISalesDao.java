package com.gobook.sales.dao;

import java.util.List;

import com.gobook.sales.dto.SalesDailyDto;
import com.gobook.sales.dto.SalesMonthlyDto;

/**
 * @클래스이름 : ISalesDao
 * @날짜 : 2015. 12. 11.
 * @개발자 : 황규성
 * @설명 : 매출 Dao 인터페이스
 */
public interface ISalesDao {
	public int salesCalculCount(String salesdaily_date);
	
	public int salesDailyCount(String salesdaily_date, String next_date);
	
	public List<SalesDailyDto> salesDailyList(String salesdaily_date, String next_date);
	
	public int salesMonthlyInsert(int daily_sum, int daily_profit, String salesmonthly_date);
	
	public int salesMonthlyCount(String start, String end);
	
	public List<SalesMonthlyDto> salesMonthlyList(String start, String end);
}
