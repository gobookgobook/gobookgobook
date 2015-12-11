package com.gobook.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.mypage.service.IMyPageService;

/**
 * @클래스이름 : MyPageController
 * @날짜 : 2015. 12. 11.
 * @개발자 : 오주석
 * @설명 : 마이페이지 controller
 */
@Controller
public class MyPageController {

	@Autowired
	private IMyPageService iMyPageService;
	
	/**
	 * @함수이름 : myPageOrderList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 주문 내역
	 */
	@RequestMapping(value="/myPage/myPageOrderList.do", method=RequestMethod.GET)
	public ModelAndView myPageOrderList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyPageService.myPageOrderList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : myPageCoupon
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 쿠폰함
	 */
	@RequestMapping(value="/myPage/myPageCoupon.do", method=RequestMethod.GET)
	public ModelAndView myPageCoupon(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyPageService.myPageCoupon(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : myPagePoint
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 포인트함
	 */
	@RequestMapping(value="/myPage/myPagePoint.do", method=RequestMethod.GET)
	public ModelAndView myPagePoint(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyPageService.myPagePoint(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : myPagePvPList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 1:1문의 내역
	 */
/*	@RequestMapping(value="/myPage/myPagePvPList.do", method=RequestMethod.GET)
	public ModelAndView myPagePvPList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyPageService.myPagePvPList(mav);
		
		return mav;
	}
	*/
	/**
	 * @함수이름 : myPagePvPRead
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 1:1문의 확인
	 */
/*	@RequestMapping(value="/myPage/myPagePvPRead.do", method=RequestMethod.GET)
	public ModelAndView myPagePvPRead(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyPageService.myPagePvPRead(mav);
		
		return mav;
	}*/

}
