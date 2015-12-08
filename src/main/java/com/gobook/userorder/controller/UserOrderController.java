package com.gobook.userorder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.userorder.service.IUserOrderService;

@Controller
public class UserOrderController {
	
	@Autowired
	IUserOrderService UserOrderService;
	
	@RequestMapping(value="/bookUser/bookOrderList.do", method=RequestMethod.GET)
	public ModelAndView userOrderList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		UserOrderService.userOrderList(mav);
		return mav;
		
	}   //주문리스트(주문리스트(결제대한 정보, 무통장, 신용카드, 휴대폰결제),(쿠폰 및 포인트사용),(배송지정보), 사용자 정보 가져오기(포인트까지), 사용자 쿠폰 가져오기)
	
	@RequestMapping(value="/bookUser/bookOrderList.do",method=RequestMethod.POST)
	public void userOrderPayOk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		UserOrderService.userOrderPay(mav);
		
	}   //주문완료, 사용자 쿠폰 사용
	public void userOrderPay(){}     //주문(주문창)
	public void userOrderCouponList(){} //주문시 쿠폰적용을위해 리스트를 가져온다.
		
	

}
