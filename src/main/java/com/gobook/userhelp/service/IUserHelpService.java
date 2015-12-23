package com.gobook.userhelp.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : IUserHelpService
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 사용자 고객센터 Service 인터페이스
 */
public interface IUserHelpService {
	public void userHelpPvP(ModelAndView mav);
	
	public void userHelpQnAList(ModelAndView mav);
	public void userHelpQnARead(ModelAndView mav);
	
	public void userHelpNoticeList(ModelAndView mav);
	public void userHelpNoticeRead(ModelAndView mav);
	
	public void userHelpLocation(ModelAndView mav);
}
