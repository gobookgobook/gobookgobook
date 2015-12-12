package com.gobook.membermanage.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.member.dto.ZipcodeDto;
import com.gobook.membermanage.dao.IMemberManageDao;
import com.gobook.membermanage.dto.ManagerCouponDto;

/**
 * @클래스이름 : MemberManageService
 * @날짜 : 2015. 12. 11.
 * @개발자 : 오주석
 * @설명 : 관리자 정보 관리 및 쿠폰 관리 service
 */
@Component
public class MemberManageService implements IMemberManageSerivce {
	
	@Autowired
	private IMemberManageDao iMemberManageDao;

	/**
	 * @함수이름 : memberManagerUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 관리자 정보 수정
	 */
	@Override
	public void memberManagerUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		MemberDto memberDto=iMemberManageDao.memberManageSelect(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + memberDto);
		
		mav.addObject("id", member_id);
		mav.addObject("memberDto", memberDto);
		mav.setViewName("memberManager/memberManagerUpdate");
		
	}

	/**
	 * @함수이름 : managerZipcode
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 우편번호 검색
	 */
	@Override
	public void managerZipcode(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String dong=request.getParameter("dong");
		GoBookAspect.logger.info(GoBookAspect.logMsg + dong);
		
		if(dong !=null && dong !=""){
			
			List<ZipcodeDto> zipcode=iMemberManageDao.managerZipcode(dong);
			GoBookAspect.logger.info(GoBookAspect.logMsg + zipcode.size());
			mav.addObject("zipcode", zipcode);
		}
		
		mav.setViewName("memberManager/memberManagerZipcode");
		
		
	}

	/**
	 * @함수이름 : memberManagerUpdateOk
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 정보 수정
	 */
	@Override
	public void memberManagerUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		MemberDto memberDto=(MemberDto) map.get("memberDto");
		
		GoBookAspect.logger.info(GoBookAspect.logMsg + memberDto);
		int value=iMemberManageDao.memberManageUpdate(memberDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + value);
		
		mav.addObject("value", value);
		mav.setViewName("memberManager/memberManagerUpdateOk");
		
	}

	/**
	 * @함수이름 : memberManageCouponInsertOk
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 제작
	 */
	@Override
	public void memberManageCouponInsertOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		ManagerCouponDto managerCouponDto=(ManagerCouponDto) map.get("managerCouponDto");
		
		int value=iMemberManageDao.memberManageCouponInsert(managerCouponDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + value);
		
		mav.addObject("value", value);
		mav.setViewName("memberManager/memberManageCouponInsertOk");
	}

	/**
	 * @함수이름 : memberManageCouponList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 목록
	 */
	@Override
	public void memberManageCouponList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<ManagerCouponDto> couponDto=iMemberManageDao.memberManageCouponListSelect();
		GoBookAspect.logger.info(GoBookAspect.logMsg + couponDto);
		
		mav.addObject("couponDto", couponDto);
		mav.setViewName("memberManager/memberManageCouponList");
	}

	/**
	 * @함수이름 : memberManageCouponRead
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 확인
	 */
	@Override
	public void memberManageCouponRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
	
		int mcoupon_num=Integer.parseInt(request.getParameter("mcoupon_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + mcoupon_num);
		
		ManagerCouponDto managerCouponDto=iMemberManageDao.memberManageCouponRead(mcoupon_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + managerCouponDto);
		
		mav.addObject("managerCouponDto", managerCouponDto);
		mav.setViewName("memberManager/memberManageCouponRead");
		
	}

	/**
	 * @함수이름 : memberManageCouponGiveUser
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 지급
	 */
	@Override
	public void memberManageCouponGiveUser(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int mcoupon_num=Integer.parseInt(request.getParameter("mcoupon_num"));
	
		List<UserCouponDto> userCouponDto=iMemberManageDao.userCouponSelect(mcoupon_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + userCouponDto.size());
		
		if(userCouponDto.size() == 0){
			List<MemberDto> member_id=iMemberManageDao.memberIdList();
			GoBookAspect.logger.info(GoBookAspect.logMsg + member_id.size());
			
	/*		int value=0;
			for(int i=0;i<member_id.size();i++){
				String id=member_id.get(i).getMember_id();
				value=iMemberManageDao.memberManageCouponGiveUserInsert(id, mcoupon_num);
			}*/
			
			
			int value=iMemberManageDao.memberManageCouponGiveUserInsert(member_id, mcoupon_num);
			mav.addObject("value", value);
			mav.addObject("mcoupon_num", mcoupon_num);
		}
		
		mav.addObject("userCouponDto", userCouponDto);
		mav.setViewName("memberManager/memberManageCouponGiveUser");
	}
}
