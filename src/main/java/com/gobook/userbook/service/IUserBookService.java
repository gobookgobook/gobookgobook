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
	public void userBookInterestReading(ModelAndView mav);
	public void suggest(ModelAndView mav);
	public void userBookGroupPurchaseList(ModelAndView mav);
	public void userBookGroupPurchaseRead(ModelAndView mav);
	public void userBookGroupPurchaseInsert(ModelAndView mav);
	public void userBookPreview(ModelAndView mav);
	public void userBookListSpecials(ModelAndView mav);
}

