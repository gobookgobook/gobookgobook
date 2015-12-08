package com.gobook.mybasket.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : IMyBasketService
 * @날짜 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니 Service 인터페이스
 */
public interface IMyBasketService {
	public void myBasketList(ModelAndView mav);
	
	public void myBasketDelete(ModelAndView mav);
}
