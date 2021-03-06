package com.gobook.location.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : ILocationService
 * @날짜 : 2015. 12. 10.
 * @개발자 : 강주혁
 * @설명 : 지점관리 Service Interface
 */
public interface ILocationService {
	public void locationWrite(ModelAndView mav);
	public void locationList(ModelAndView mav);
	public void locationUpdate(ModelAndView mav);
	public void locationUpdateOk(ModelAndView mav);
	public void locationDelete(ModelAndView mav);
}
