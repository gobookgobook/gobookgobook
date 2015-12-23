package com.gobook.adminhelp.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : IAdminHelpService
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 관리자 고객센터 Service 인터페이스
 */
public interface IAdminHelpService {
	public void adminHelpQnAWrite(ModelAndView mav);
	public void adminHelpQnAWriteOk(ModelAndView mav);
	public void adminHelpQnAList(ModelAndView mav);
	public void adminHelpQnARead(ModelAndView mav);
	public void adminHelpQnADelete(ModelAndView mav);
	public void adminHelpQnAUpdate(ModelAndView mav);
	public void adminHelpQnAUpdateOk(ModelAndView mav);
	
	public void adminHelpNoticeWriteOk(ModelAndView mav);
	public void adminHelpNoticeList(ModelAndView mav);
	public void adminHelpNoticeRead(ModelAndView mav);
	public void adminHelpNoticeDelete(ModelAndView mav);
	public void adminHelpNoticeUpdate(ModelAndView mav);
	public void adminHelpNoticeUpdateOk(ModelAndView mav);
	
}
