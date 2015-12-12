package com.gobook.sales.dao;

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
	public int salesDailyCount() {
		return sqlSessionTemplate.selectOne("dao.salesMapper.salesDailyCount");
	}

	/**
	 * @함수이름 : salesDailyList
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 황규성
	 * @설명 : 일일매출 내역
	 */
	@Override
	public List<SalesDailyDto> salesDailyList() {
		return sqlSessionTemplate.selectList("dao.salesMapper.salesDailyList");
	}
	
	
}
