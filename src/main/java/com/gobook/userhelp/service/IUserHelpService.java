package com.gobook.userhelp.service;

import org.springframework.web.servlet.ModelAndView;

public interface IUserHelpService {
	public void userHelpPvP(ModelAndView mav);
	
	public void userHelpQnAList(ModelAndView mav);
	public void userHelpQnARead(ModelAndView mav);
	
	public void userHelpNoticeList(ModelAndView mav);
	public void userHelpNoticeRead(ModelAndView mav);
}
