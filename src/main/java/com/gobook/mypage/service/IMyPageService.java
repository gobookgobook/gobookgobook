package com.gobook.mypage.service;

import org.springframework.web.servlet.ModelAndView;

public interface IMyPageService {
	
	public void myPageOrderList(ModelAndView mav);
	public void myPageCoupon(ModelAndView mav);
	public void myPagePoint(ModelAndView mav);
/*	public void myPagePvPList(ModelAndView mav);
	public void myPagePvPRead(ModelAndView mav);*/
	
}
