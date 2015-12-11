package com.gobook.membermanage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.member.dto.MemberDto;
import com.gobook.membermanage.dto.ManagerCouponDto;
import com.gobook.membermanage.service.IMemberManageSerivce;
import com.gobook.mypage.service.IMyPageService;

/**
 * @클래스이름 : MemberManageController
 * @날짜 : 2015. 12. 11.
 * @개발자 : 오주석
 * @설명 : 관리자 쿠폰 및, 정보 관리 Controller
 */
@Controller
public class MemberManageController {

	@Autowired
	private IMemberManageSerivce iMemberManageService;
	
	/**
	 * @함수이름 : memberManagerUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 관리자 정보 수정
	 */
	@RequestMapping(value="/memberManager/memberManagerUpdate.do", method=RequestMethod.GET)
	public ModelAndView memberManagerUpdate(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberManageService.memberManagerUpdate(mav);
		
		return mav;
	}
						   
	/**
	 * @함수이름 : managerZipcode
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 관리자 정보 수정(우편번호 변경)
	 */
	@RequestMapping(value="/memberManage/managerZipcode.do", method=RequestMethod.GET)
	public ModelAndView managerZipcode(HttpServletRequest request, HttpServletResponse response){
				
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberManageService.managerZipcode(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberManagerUpdateOk
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 관리자 정보 수정 완료
	 */
	@RequestMapping(value="/memberManager/memberManagerUpdateOk.do", method=RequestMethod.POST)
	public ModelAndView memberManagerUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		iMemberManageService.memberManagerUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberManageCouponInsert
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 제작
	 */
	@RequestMapping(value="/memberManager/memberManageCouponInsert.do", method=RequestMethod.GET)
	public ModelAndView memberManageCouponInsert(HttpServletRequest request, HttpServletResponse response){

		return new ModelAndView("memberManager/memberManageCouponInsert");
	}
	
	/**
	 * @함수이름 : memberManageCouponInsertOk
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 제작 확인
	 */
	@RequestMapping(value="/memberManager/memberManageCouponInsertOk.do", method=RequestMethod.POST)
	public ModelAndView memberManageCouponInsertOk(HttpServletRequest request, HttpServletResponse response, ManagerCouponDto managerCouponDto){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("managerCouponDto", managerCouponDto);
		iMemberManageService.memberManageCouponInsertOk(mav);
		
		return mav;
		
	}
	
	/**
	 * @함수이름 : memberManageCouponList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 목록
	 */
	@RequestMapping(value="/memberManager/memberManageCouponList.do", method=RequestMethod.GET)
	public ModelAndView memberManageCouponList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberManageService.memberManageCouponList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberManageCouponRead
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 상세 확인
	 */
	@RequestMapping(value="/memberManager/memberManageCouponRead.do", method=RequestMethod.GET)
	public ModelAndView memberManageCouponRead(HttpServletRequest request, HttpServletResponse response, ManagerCouponDto managerCouponDto){
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("managerCouponDto", managerCouponDto);
		iMemberManageService.memberManageCouponRead(mav);
		
		return mav;
		
	}
	
	/**
	 * @함수이름 : memberManageCouponGiveUser
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰 지급
	 */
	@RequestMapping(value="/memberManager/memberManageCouponGiveUser.do")
	public ModelAndView memberManageCouponGiveUser(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberManageService.memberManageCouponGiveUser(mav);
		
		return mav;
	}
}
