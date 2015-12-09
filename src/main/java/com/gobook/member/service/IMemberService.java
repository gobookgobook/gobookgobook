package com.gobook.member.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : IMemberService
 * @날짜 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 회원관리 Service Interface
 */
public interface IMemberService {
	public void zipcode(ModelAndView mav);
	public void memberIdCheck(ModelAndView mav);
	public void memberInsert(ModelAndView mav);
	public void memberLogin(ModelAndView mav);
	public void memberDeleteOk(ModelAndView mav);
	public void memberUpdate(ModelAndView mav);
	public void memberUpdateOk(ModelAndView mav);
}
