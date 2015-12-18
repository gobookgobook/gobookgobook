package com.gobook.userorder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.userorder.dto.UserOrderDto;
import com.gobook.userorder.service.IUserOrderService;


/**
 * @클래스이름 : UserOrderController
 * @날짜 : 2015. 12. 7.
 * @개발자 : 김재석
 * @설명 : 주문 Controller
 */
@Controller
public class UserOrderController {
	
	@Autowired
	IUserOrderService iUserOrderService;
	
	/**
	 * @클래스이름 : userOrderList
	 * @날짜 : 2015. 12. 7.
	 * @개발자 : 김재석
	 * @설명 : 사용자 주문리스트((결제대한 정보, 무통장, 신용카드, 휴대폰결제),(쿠폰 및 포인트사용),(배송지정보), 사용자 정보 가져오기(포인트까지), 사용자 쿠폰 가져오기))
	 */
	@RequestMapping(value="/userOrder/userOrderList.do", method=RequestMethod.GET)
	public ModelAndView userOrderList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		iUserOrderService.userOrderList(mav);
		return mav;
		
	}
	
	/**
	 * @함수이름 : userOrder
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 오주석
	 * @설명 : 도서 즉시 구매
	 */
	@RequestMapping(value="/userOrder/userOrder.do", method=RequestMethod.GET)
	public ModelAndView userOrder(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		iUserOrderService.userOrder(mav);
		return mav;
		
	}
	
	/**
	 * @함수이름 : userOrderCouponList
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 쿠폰 리스트
	 */
	@RequestMapping(value="/userOrder/userOrderCouponList.do", method=RequestMethod.GET)
	public ModelAndView userOrderCouponList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserOrderService.userOrderCouponList(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : userOrderPay
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 주문 완료 시 화면
	 */
	@RequestMapping(value="/userOrder/userOrderPay.do", method=RequestMethod.POST)
	public ModelAndView userOrderPay(HttpServletRequest request, HttpServletResponse response, UserOrderDto userOrderDto){		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("userOrderDto", userOrderDto);
		iUserOrderService.userOrderPay(mav);
		return mav;
	}     
}
