package com.gobook.userorder.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : IUserOrderService
 * @날짜 : 2015-12-08
 * @개발자 : 김재석
 * @설명 : 
 */
public interface IUserOrderService {
	
	public void userOrderList(ModelAndView mav);
	
	public void userOrder(ModelAndView mav);
	
	public void userOrderPay(ModelAndView mav);
	
	public void userOrderCouponList(ModelAndView mav);
	

}
