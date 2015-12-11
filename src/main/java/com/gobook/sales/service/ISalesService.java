package com.gobook.sales.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : ISalesService
 * @날짜 : 2015. 12. 11.
 * @개발자 : 황규성
 * @설명 : 매출 Service 인터페이스
 */
public interface ISalesService {
	public void salesDailyList(ModelAndView mav);
}
