package com.gobook.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.mypage.service.IMyPageService;

@Controller
public class MyPageController {

	@Autowired
	private IMyPageService iMyPageService;
	
	@RequestMapping(value="/myPage/myPageOrderList.do", method=RequestMethod.GET)
	public ModelAndView myPageOrderList(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyPageService.myPageOrderList(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/myPage/myPageCoupon.do", method=RequestMethod.GET)
	public ModelAndView myPageCoupon(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyPageService.myPageCoupon(mav);
		
		return mav;
	}
	
}
