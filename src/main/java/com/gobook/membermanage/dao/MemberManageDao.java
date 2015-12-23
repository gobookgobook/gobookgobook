package com.gobook.membermanage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.member.dto.ZipcodeDto;
import com.gobook.membermanage.dto.ManagerCouponDto;

/**
 * @클래스이름 : MemberManageDao
 * @날짜 : 2015. 12. 11.
 * @개발자 : 오주석
 * @설명 : 관리자 정보 관리 및 쿠폰관리 Dao
 */
@Component
public class MemberManageDao implements IMemberManageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	/**
	 * @함수이름 : memberManageSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 관리자 정보 가져옴
	 */
	@Override
	public MemberDto memberManageSelect(String member_id) {

		return sqlSessionTemplate.selectOne("dao.memberManageMapper.memberManageSelect", member_id);
	}

	/**
	 * @함수이름 : managerZipcode
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 우편번호 검색
	 */
	@Override
	public List<ZipcodeDto> managerZipcode(String dong) {

		return sqlSessionTemplate.selectList("dao.memberManageMapper.managerZipcode", dong);
	}

	/**
	 * @함수이름 : memberManageUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 관리자 정보 수정 
	 */
	@Override
	public int memberManageUpdate(MemberDto memberDto) {

		return sqlSessionTemplate.update("dao.memberManageMapper.memberManageUpdate", memberDto);
	}

	/**
	 * @함수이름 : memberManageCouponInsert
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 생성
	 */
	@Override
	public int memberManageCouponInsert(ManagerCouponDto managerCouponDto) {

		return sqlSessionTemplate.insert("dao.memberManageMapper.memberManageCouponInsert", managerCouponDto);
	}

	/**
	 * @함수이름 : memberManageCouponListSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 리스트
	 */
	@Override
	public List<ManagerCouponDto> memberManageCouponListSelect() {

		return sqlSessionTemplate.selectList("dao.memberManageMapper.memberManageCouponListSelect");
	}

	/**
	 * @함수이름 : memberManageCouponRead
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 상세 확인
	 */
	@Override
	public ManagerCouponDto memberManageCouponRead(int mcoupon_num) {

		return sqlSessionTemplate.selectOne("dao.memberManageMapper.memberManageCouponRead", mcoupon_num);
	}

	/**
	 * @함수이름 : memberIdList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 회원 아이디 불러오기(쿠폰제작)
	 */
	@Override
	public List<MemberDto> memberIdList() {

		return sqlSessionTemplate.selectList("dao.memberManageMapper.memberIdList");
	}

	/**
	 * @함수이름 : memberManageCouponGiveUserInsert
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 지급
	 */
	@Override
	public int memberManageCouponGiveUserInsert(List<MemberDto> member_id, int mcoupon_num) {
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("member_id", member_id);
		hMap.put("mcoupon_num", mcoupon_num);
	
		return sqlSessionTemplate.insert("dao.memberManageMapper.memberManageCouponGiveUserInsert", hMap);
	}

	/**
	 * @함수이름 : memberManagerCouponGiveUserUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 제작
	 */
	@Override
	public List<UserCouponDto> userCouponSelect(int mcoupon_num) {

		return sqlSessionTemplate.selectList("dao.memberManageMapper.userCouponSelect", mcoupon_num);
	}



}
