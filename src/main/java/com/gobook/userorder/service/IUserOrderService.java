package com.gobook.userorder.service;

import org.springframework.web.servlet.ModelAndView;

public interface IUserOrderService {
	
	public void userOrderList(ModelAndView mav);
	
	public void userOrderPay(ModelAndView mav);
	

}
