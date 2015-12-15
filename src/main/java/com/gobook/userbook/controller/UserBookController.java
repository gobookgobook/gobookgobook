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
	
	@RequestMapping(value="/userBook/userBookRead.do", method=RequestMethod.GET)
	public ModelAndView userBookRead(HttpServletRequest request, HttpServletResponse servletResponse){
		
		System.out.println("ok");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iUserBookService.userBookRead(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/userBook/userBookBasketInsert.do", method=RequestMethod.GET)
	public ModelAndView userBookBasketInsert(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookBasketInsert(mav);
		
		return null;
		
	}
	
	@RequestMapping(value="/userBook/userBookSoldOutAsk.do", method=RequestMethod.GET)
	public ModelAndView userBookSoldOutAsk(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookSoldOutAsk(mav);
		
		return null;
	}
	
	@RequestMapping(value="/userBook/userBookGroupPurchaseAsk.do", method=RequestMethod.GET)
	public ModelAndView userBookGroupPurchaseAsk(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookGroupPurchaseAsk(mav);
		
		return null;
	}
	
	@RequestMapping(value="/userBook/userBookStarInsert.do", method=RequestMethod.GET)
	public ModelAndView userBookStarInsert(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iUserBookService.userBookStarInsert(mav);
		
		return null;
	}
}
