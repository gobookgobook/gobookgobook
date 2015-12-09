package com.gobook.adminhelp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.adminhelp.service.IAdminHelpService;
import com.gobook.help.dto.HelpQnADto;
@Controller
public class AdminHelpController {
	@Autowired
	private IAdminHelpService iadminHelpService;
	
	@RequestMapping(value="/help/adminHelpQnAList.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		iadminHelpService.adminHelpQnAList(mav);
		return mav;
	}
	@RequestMapping(value="/help/adminHelpQnAWrite.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAWrite(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("help/adminHelpQnAWrite");
		
	}
	@RequestMapping(value="/help/adminHelpQnAWrite.do", method=RequestMethod.POST)
	public ModelAndView adminHelpQnAWriteOk(HttpServletRequest request, HttpServletResponse response, HelpQnADto helpQnADto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("helpQnADto", helpQnADto);
		
		iadminHelpService.adminHelpQnAWriteOk(mav);
		return mav;
		
	}
}
