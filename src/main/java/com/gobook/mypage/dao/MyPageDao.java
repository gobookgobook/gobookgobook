package com.gobook.mypage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

//import com.gobook.help.dto.HelpPvPDto;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : MyPageDao
 * @날짜 : 2015. 12. 11.
 * @개발자 : 오주석
 * @설명 : 마이페이지 Dao
 */
@Component
public class MyPageDao implements IMyPageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * @함수이름 : myPageOrderListSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public List<UserOrderDto> myPageOrderListSelect(String member_id) {

		return sqlSessionTemplate.selectList("dao.myPageMapper.myPageOrderListSelect", member_id);
	}

	/**
	 * @함수이름 : myPageOrderCount
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public int myPageOrderCount(String member_id) {
		
		return sqlSessionTemplate.selectOne("dao.myPageMapper.myPageOrderCount", member_id);
	}

	/**
	 * @함수이름 : myPageHistoryListSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public List<UserOrderDto> myPageHistoryListSelect(int startRow, int endRow, String member_id) {

		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("member_id", member_id);
		
		return sqlSessionTemplate.selectList("dao.myPageMapper.myPageHistoryListSelect", hMap);
	}

	/**
	 * @함수이름 : myPageCouponSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public List<UserCouponDto> myPageCouponSelect(String member_id) {

		return sqlSessionTemplate.selectList("dao.myPageMapper.myPageCouponSelect", member_id);
	}

	/**
	 * @함수이름 : myPagePointSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public int myPagePointSelect(String member_id) {

		return sqlSessionTemplate.selectOne("dao.myPageMapper.myPagePointSelect", member_id);
	}

	/**
	 * @함수이름 : myPagePvPListSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
/*	@Override
	public List<HelpPvPDto> myPagePvPListSelect(String member_id) {

		return sqlSessionTemplate.selectList("dao.myPageMapper.myPagePvPListSelect", member_id);
	}*/

	/**
	 * @함수이름 : myPagePvPRead
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
/*	@Override
	public HelpPvPDto myPagePvPRead(int helppvp_num) {

		return sqlSessionTemplate.selectOne("dao.myPageMapper.myPagePvPRead", helppvp_num);
	}
*/
}
