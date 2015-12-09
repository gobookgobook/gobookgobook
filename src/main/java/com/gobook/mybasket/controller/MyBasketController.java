package com.gobook.mybasket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.mybasket.service.IMyBasketService;

/**
 * @클래스이름 : MyBasketController
 * @날짜 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니Controller 클래스
 */
@Controller
public class MyBasketController {
	@Autowired
	private IMyBasketService iMyBasketService;
	
	/**
	 * @함수이름 : myBasketList
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 내역
	 */
	@RequestMapping(value="/myBasket/myBasketList.do", method=RequestMethod.GET)
	public ModelAndView myBasketList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyBasketService.myBasketList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : myBasketDelete
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 내역 제거
	 */
	@RequestMapping(value="/myBasket/myBasketDelete.do", method=RequestMethod.GET)
	public ModelAndView myBasketDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iMyBasketService.myBasketDelete(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : myBasketUpdate
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 수정
	 */
	@RequestMapping(value="/myBasket/myBasketUpdate.do", method=RequestMethod.GET)
	public ModelAndView myBasketUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iMyBasketService.myBasketUpdate(mav);
		
		return null;
	}
}
