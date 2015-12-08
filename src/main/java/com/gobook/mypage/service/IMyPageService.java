package com.gobook.mypage.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : IMyPageService
 * @날짜 : 2015. 12. 8.
 * @개발자 : 오주석
 * @설명 : 
 */
public interface IMyPageService {
	
	public void myPageOrderList(ModelAndView mav);
	public void myPageCoupon(ModelAndView mav);
	public void myPagePoint(ModelAndView mav);
/*	public void myPagePvPList(ModelAndView mav);
	public void myPagePvPRead(ModelAndView mav);
	*/
}
