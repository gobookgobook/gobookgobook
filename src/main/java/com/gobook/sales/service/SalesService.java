package com.gobook.sales.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.sales.dao.ISalesDao;

/**
 * @클래스이름 : SalesService
 * @날짜 : 2015. 12. 11.
 * @개발자 : 황규성
 * @설명 : 매출 Service
 */
@Component
public class SalesService implements ISalesService {
	@Autowired
	private ISalesDao iSalesDao;

	@Override
	public void salesDailyList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		GoBookAspect.logger.info(GoBookAspect.logMsg + "OK");
		
		
		
	}
}
