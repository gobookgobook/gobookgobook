package com.gobook.userbook.service;

import org.springframework.web.servlet.ModelAndView;

public interface IUserBookService {

	public void userBookRead(ModelAndView mav);
	public void userBookBasketInsert(ModelAndView mav);
	public void userBookSoldOutAsk(ModelAndView mav);
	public void userBookGroupPurchaseAsk(ModelAndView mav);
	public void userBookStarInsert(ModelAndView mav);
	public void userBookList(ModelAndView mav);
	public void userBookSerch(ModelAndView mav);
}
