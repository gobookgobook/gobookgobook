package com.gobook.userbook.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.userbook.service.IUserBookService;

@Controller
public class UserBookController {

	@Autowired
	private IUserBookService iUserBookService;
	
	@RequestMapping(value="/userBook/userBookList.do", method=RequestMethod.GET)
	public ModelAndView userBookList(HttpServletRequest request, HttpServletResponse servletResponse){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserBookService.userBookList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : userBookRead
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@RequestMapping(value="/userBook/userBookRead.do", method=RequestMethod.GET)
	public ModelAndView userBookRead(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserBookService.userBookRead(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : userBookBasketInsert
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@RequestMapping(value="/userBook/userBookBasketInsert.do", method=RequestMethod.GET)
	public ModelAndView userBookBasketInsert(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookBasketInsert(mav);
		
		return null;
		
	}
	
	/**
	 * @함수이름 : userBookSoldOutAsk
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@RequestMapping(value="/userBook/userBookSoldOutAsk.do", method=RequestMethod.GET)
	public ModelAndView userBookSoldOutAsk(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookSoldOutAsk(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseAsk
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@RequestMapping(value="/userBook/userBookGroupPurchaseAsk.do", method=RequestMethod.GET)
	public ModelAndView userBookGroupPurchaseAsk(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookGroupPurchaseAsk(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : userBookStarInsert
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@RequestMapping(value="/userBook/userBookStarInsert.do", method=RequestMethod.GET)
	public ModelAndView userBookStarInsert(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookStarInsert(mav);
		
		return null;
	}
	
	@RequestMapping(value="/userBook/userBookSerch.do", method=RequestMethod.GET)
	public ModelAndView userBookSerch(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserBookService.userBookSerch(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/userBook/userBookInterestReading.do", method=RequestMethod.GET)
	public ModelAndView userBookInterestReading(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserBookService.userBookInterestReading(mav);
		
		return mav;
		
	}
	
	/**
	 * @함수이름 : suggest
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 성기훈
	 * @설명 : 도서검색 suggest
	 */
	@RequestMapping(value="/userBook/suggest.do", method=RequestMethod.POST)
	public ModelAndView suggest(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.suggest(mav);
		
		return null;
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseList
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@RequestMapping(value="/userBook/userBookGroupPurchaseList.do", method=RequestMethod.GET)
	public ModelAndView userBookGroupPurchaseList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserBookService.userBookGroupPurchaseList(mav);
		
		return mav;
		
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseRead
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 진행중인 공동구매 신청
	 */
	@RequestMapping(value="/userBook/userBookGroupPurchaseRead.do", method=RequestMethod.GET)
	public ModelAndView userBookGroupPurchaseRead(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserBookService.userBookGroupPurchaseRead(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/userBook/userBookGroupPurchaseInsert.do", method=RequestMethod.GET)
	public ModelAndView userBookGroupPurchaseInsert(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookGroupPurchaseInsert(mav);
		
		return null;
	}
	
}
