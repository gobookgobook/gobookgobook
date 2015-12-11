package com.gobook.membermanage.service;

import org.springframework.web.servlet.ModelAndView;

public interface IMemberManageSerivce {

	public void memberManagerUpdate(ModelAndView mav);
	public void managerZipcode(ModelAndView mav);
	public void memberManagerUpdateOk(ModelAndView mav);
	public void memberManageCouponInsertOk(ModelAndView mav);
	public void memberManageCouponList(ModelAndView mav);
	public void memberManageCouponRead(ModelAndView mav);
	public void memberManageCouponGiveUser(ModelAndView mav);
}
