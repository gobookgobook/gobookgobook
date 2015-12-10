package com.gobook.mybasket.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.mybasket.dto.MyBasketDto;

/**
 * @클래스이름 : MyBasketDao
 * @날짜 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니 Dao
 */
@Component
public class MyBasketDao implements IMyBasketDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * @함수이름 : myBasketCount
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 물품 개수
	 */
	@Override
	public int myBasketCount(String member_id) {
		return sqlSessionTemplate.selectOne("dao.myBasketMapper.myBasketCount", member_id);
	}

	/**
	 * @함수이름 : myBasketList
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 내역
	 */
	@Override
	public List<MyBasketDto> myBasketList(String member_id) {
		return sqlSessionTemplate.selectList("dao.myBasketMapper.myBasketList", member_id);
	}

	/**
	 * @함수이름 : myBasketDelete
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 내역 제거
	 */
	@Override
	public int myBasketDelete(int basket_num) {
		return sqlSessionTemplate.delete("dao.myBasketMapper.myBasketDelete", basket_num);
	}
	
	/**
	 * @함수이름 : myBasketSelect
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 회원 전체 List 정보 select
	 */
	@Override
	public List<MyBasketDto> myBasketSelectList(String member_id) {
		return sqlSessionTemplate.selectList("dao.myBasketMapper.myBasketSelectList", member_id);
	}

	/**
	 * @함수이름 : myBasketUpdate
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 수정
	 */
	@Override
	public int myBasketUpdate(MyBasketDto myBasketDto) {
		return sqlSessionTemplate.update("dao.myBasketMapper.myBasketUpdate", myBasketDto);
	}

	/**
	 * @함수이름 : myBasketSelect
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 황규성
	 * @설명 : update에서 회원 한명의 정보 select
	 */
	@Override
	public MyBasketDto myBasketSelect(int basket_num) {
		return sqlSessionTemplate.selectOne("dao.myBasketMapper.myBasketSelect", basket_num);
	}
}
