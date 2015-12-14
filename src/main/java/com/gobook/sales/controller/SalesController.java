package com.gobook.sales.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.sales.service.ISalesService;

/**
 * @클래스이름 : SalesController
 * @날짜 : 2015. 12. 11.
 * @개발자 : 황규성
 * @설명 : 매출 Controller 클래스
 */
@Controller
public class SalesController {
	@Autowired
	private ISalesService iSalesService;
	
	/**
	 * @함수이름 : salesDailyList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 황규성
	 * @설명 : 일일매출 내역
	 */
	@RequestMapping(value="/sales/salesDailyList.do", method=RequestMethod.GET)
	public ModelAndView salesDailyList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iSalesService.salesDailyList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : salesMonthlyInsert
	 * @작성일 : 2015. 12. 14.
	 * @개발자 : 황규성
	 * @설명 : 월별매출 삽입
	 */
	@RequestMapping(value="/sales/salesMonthlyInsert.do", method=RequestMethod.GET)
	public ModelAndView salesMonthlyInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iSalesService.salesMonthlyInsert(mav);
		
		return mav;
	}
}
