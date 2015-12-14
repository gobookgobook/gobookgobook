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
	
	
}
