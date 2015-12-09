package com.gobook.location.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.location.service.ILocationService;

/**
 * @클래스이름 : LocationController
 * @날짜 : 2015. 12. 9.
 * @개발자 : 강주혁
 * @설명 : 지점관리 Controller
 */
@Controller
public class LocationController {
	@Autowired
	private ILocationService IMemberService;
	
	@RequestMapping(value="/location/locationWrite.do", method=RequestMethod.GET)
	public ModelAndView memberRegister(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("/location/locationWrite");
	}
	
}
