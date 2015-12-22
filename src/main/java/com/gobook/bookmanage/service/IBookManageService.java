package com.gobook.bookmanage.service;

import org.springframework.web.servlet.ModelAndView;

/**
 * @클래스이름 : IBookManageService
 * @날짜 : 2015. 12. 18.
 * @개발자 : 성기훈
 * @설명 : 도서관리 서비스 인터페이스
 */
public interface IBookManageService {
	public void bookManager(ModelAndView mav);
	public void bookInsert(ModelAndView mav);
	public void bookInsertOk(ModelAndView mav);
	public void bookStockList(ModelAndView mav);
	public void bookStockUpdate(ModelAndView mav);
	public void bookStockUpdateOk(ModelAndView mav);
	public void bookReOrderList(ModelAndView mav);
	public void bookReOrderCount(ModelAndView mav);
	public void bookGroupPurchase(ModelAndView mav);
	public void bookSoldOutList(ModelAndView mav);
	public void bookGroupPurchaseInsert(ModelAndView mav);
	public void bookGroupPurchaseInsertOk(ModelAndView mav);
	public void bookGroupPurchaseUpdate(ModelAndView mav);
	public void bookGroupPurchaseUpdateOk(ModelAndView mav);
	public void bookGroupPurchaseDelete(ModelAndView mav);
	public void bookSchedule(ModelAndView mav);
	public void bookNewPublishList(ModelAndView mav);
	public void bookList(ModelAndView mav);
	public void bookRead(ModelAndView mav);
}
