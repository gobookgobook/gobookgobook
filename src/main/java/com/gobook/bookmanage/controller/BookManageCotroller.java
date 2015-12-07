package com.gobook.bookmanage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.bookmanage.service.IBookManageService;

@Controller
public class BookManageCotroller {
	
	@Autowired
	private IBookManageService iBookManageService;
	
	@RequestMapping(value="/bookManage/bookInsert.do", method=RequestMethod.GET)
	public ModelAndView bookInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookInsert(mav);
		
		return mav;
	}
}