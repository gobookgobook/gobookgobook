package com.gobook.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.member.dto.MemberDto;
import com.gobook.member.service.IMemberService;

@Controller
public class MemberController {
	@Autowired
	private IMemberService iMemberService;
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public ModelAndView memberRegister(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("member/register");
	}
	
	@RequestMapping(value="/member/zipcode.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView zipcode(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.zipcode(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/idCheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.memberIdCheck(mav);
		
		return mav;
	}
	
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public ModelAndView memberRegisterOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		iMemberService.memberInsert(mav);
		
		return mav;
	}
}
