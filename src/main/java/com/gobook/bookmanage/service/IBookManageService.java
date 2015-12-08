package com.gobook.bookmanage.service;

import org.springframework.web.servlet.ModelAndView;

public interface IBookManageService {
	public void bookInsert(ModelAndView mav);
	public void bookInsertOk(ModelAndView mav);
	public void bookStockList(ModelAndView mav);
	public void bookStockUpdate(ModelAndView mav);
}
