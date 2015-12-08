package com.gobook.member.service;

import org.springframework.web.servlet.ModelAndView;

public interface IMemberService {
	public void zipcode(ModelAndView mav);
	public void memberIdCheck(ModelAndView mav);
	public void memberInsert(ModelAndView mav);
}
