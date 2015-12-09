package com.gobook.bookmanage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dto.BookDto;
import com.gobook.bookmanage.service.IBookManageService;

@Controller
public class BookManageCotroller {
	
	@Autowired
	private IBookManageService iBookManageService;
	
	/**
	 * @함수이름 : bookManager
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 도서관리 메인페이지
	 */
	@RequestMapping(value="/bookManage/bookManage.do", method=RequestMethod.GET)
	public ModelAndView bookManager(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView();
	}

	/**
	 * @함수이름 : bookInsert
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서등록
	 */
	@RequestMapping(value="/bookManage/bookInsert.do", method=RequestMethod.GET)
	public ModelAndView bookInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookInsert(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookInsertOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서등록
	 */
	@RequestMapping(value="/bookManage/bookInsert.do", method=RequestMethod.POST)
	public ModelAndView bookInsertOk(HttpServletRequest request, HttpServletResponse response, BookDto bookDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		iBookManageService.bookInsertOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookStockList
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서현황
	 */
	@RequestMapping(value="/bookManage/bookStockList.do", method=RequestMethod.GET)
	public ModelAndView bookStockList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookStockList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookStockUpdate
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정(입고신청)
	 */
	@RequestMapping(value="/bookManage/bookStockUpdate.do", method=RequestMethod.GET)
	public ModelAndView bookStockUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookStockUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookStockUpdateOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정(입고신청)
	 */
	@RequestMapping(value="/bookManage/bookStockUpdate.do", method=RequestMethod.POST)
	public ModelAndView bookStockUpdateOk(HttpServletRequest request, HttpServletResponse response, BookDto bookDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		iBookManageService.bookStockUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookReOrderList
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 현황
	 */
	@RequestMapping(value="/bookManage/bookReOrderList.do", method=RequestMethod.GET)
	public ModelAndView bookReOrderList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookReOrderList(mav);
		
		return mav;
	}
}
