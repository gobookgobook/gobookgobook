package com.gobook.sales.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.aop.GoBookAspect;
import com.gobook.sales.dto.SalesDailyDto;
import com.gobook.sales.dto.SalesMonthlyDto;

/**
 * @클래스이름 : SalesDao
 * @날짜 : 2015. 12. 11.
 * @개발자 : 황규성
 * @설명 : 매출 Dao
 */

@Component
public class SalesDao implements ISalesDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	/**
	 * @함수이름 : salesCalculCount
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 황규성
	 * @설명 : 정산 여부 확인을 위한 count
	 */
	@Override
	public int salesCalculCount(String salesdaily_date) {
		return sqlSessionTemplate.selectOne("dao.salesMapper.salesCalculCount", salesdaily_date);
	}
	
	/**
	 * @함수이름 : salesCount
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 황규성
	 * @설명 : 일일매출 DB 리스트 개수
	 */
	@Override
	public int salesDailyCount(String salesdaily_date, String next_date) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("salesdaily_date", salesdaily_date);
		hMap.put("next_date", next_date);
		
		return sqlSessionTemplate.selectOne("dao.salesMapper.salesDailyCount", hMap);
	}

	/**
	 * @함수이름 : salesDailyList
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 황규성
	 * @설명 : 일일매출 내역
	 */
	@Override
	public List<SalesDailyDto> salesDailyList(String salesdaily_date, String next_date) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("salesdaily_date", salesdaily_date);
		hMap.put("next_date", next_date);
		
		return sqlSessionTemplate.selectList("dao.salesMapper.salesDailyList", hMap);
	}

	/**
	 * @함수이름 : salesMonthlyInsert
	 * @작성일 : 2015. 12. 14.
	 * @개발자 : 황규성
	 * @설명 : 월별매출 삽입
	 */
	@Override
	public int salesMonthlyInsert(int daily_sum, int daily_profit, String salesmonthly_date) {
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("daily_sum", daily_sum);
		hMap.put("daily_profit", daily_profit);
		hMap.put("salesmonthly_date", salesmonthly_date);
		
		return sqlSessionTemplate.insert("dao.salesMapper.salesMonthlyInsert", hMap);
	}

	/**
	 * @함수이름 : salesMonthlyCount
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 황규성
	 * @설명 : 월별매출 DB 리스트 개수
	 */
	@Override
	public int salesMonthlyCount(String start, String end) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("start", start);
		hMap.put("end", end);
		
		return sqlSessionTemplate.selectOne("dao.salesMapper.salesMonthlyCount", hMap);
	}

	/**
	 * @함수이름 : salesMonthlyList
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 황규성
	 * @설명 : 월별매출 내역
	 */
	@Override
	public List<SalesMonthlyDto> salesMonthlyList(String start, String end) {
		HashMap<String, String> hMap=new HashMap<String, String>();
		hMap.put("start", start);
		hMap.put("end", end);
		
		return sqlSessionTemplate.selectList("dao.salesMapper.salesMonthlyList", hMap);
	}
	
}
