package com.gobook.bookmanage.service;

import org.springframework.web.servlet.ModelAndView;

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
}
