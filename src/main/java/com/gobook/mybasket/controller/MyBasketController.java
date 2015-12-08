package com.gobook.mybasket.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.mybasket.service.IMyBasketService;

@Controller
public class MyBasketController {
	@Autowired
	private IMyBasketService iMyBasketService;
	
	@RequestMapping(value="/myBasket/myBasketList.do", method=RequestMethod.GET)
	public ModelAndView myBasketList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMyBasketService.myBasketList(mav);
		
		return mav;
	}
}
