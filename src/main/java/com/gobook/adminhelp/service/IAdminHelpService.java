package com.gobook.adminhelp.service;

import org.springframework.web.servlet.ModelAndView;

public interface IAdminHelpService {
	public void adminHelpQnAWrite(ModelAndView mav);
	public void adminHelpQnAWriteOk(ModelAndView mav);
	public void adminHelpQnAListSelect(ModelAndView mav);
	public void adminHelpQnARead(ModelAndView mav);
	public void adminHelpQnADelete(ModelAndView mav);
	public void adminHelpQnAUpdate(ModelAndView mav);
	public void adminHelpQnAUpdateOk(ModelAndView mav);
	
}
