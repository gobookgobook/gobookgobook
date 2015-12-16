package com.gobook.userhelp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.help.dto.HelpPvPDto;
import com.gobook.userhelp.service.IUserHelpService;
@Controller
public class UserHelpController {
	@Autowired
	private IUserHelpService iUserHelpService;

	
	@RequestMapping(value="help/userHelpPvP.do", method=RequestMethod.GET)
	public ModelAndView userHelpPvP(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("help/userHelpPvP");
	}
	@RequestMapping(value="help/userHelpPvP.do", method=RequestMethod.POST)
	public ModelAndView userHelpPvPOk(HttpServletRequest request, HttpServletResponse response, HelpPvPDto helpPvPDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("HelpPvPDto", helpPvPDto);
		
		iUserHelpService.userHelpPvP(mav);
		return mav;	
	}
	@RequestMapping(value="help/userHelpQnA.do", method=RequestMethod.GET)
	public ModelAndView userHelpQnA(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		iUserHelpService.userHelpQnAList(mav);
		return mav;
	}
	@RequestMapping(value="help/userHelpQnARead.do", method=RequestMethod.GET)
	public ModelAndView userHelpQnARead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iUserHelpService.userHelpQnARead(mav);
		return mav;
	}
	@RequestMapping(value="help/userHelpNotice.do", method=RequestMethod.GET)
	public ModelAndView userHelpNotice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iUserHelpService.userHelpNoticeList(mav);
		
		return mav;
	}
	@RequestMapping(value="help/userHelpNoticeRead.do",method=RequestMethod.GET)
	public ModelAndView userHelpNoticeRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iUserHelpService.userHelpNoticeRead(mav);
		return mav;
		
	}
}
