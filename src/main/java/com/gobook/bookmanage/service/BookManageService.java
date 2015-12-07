package com.gobook.bookmanage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.bookmanage.dao.IBookManageDao;

@Component
public class BookManageService implements IBookManageService {

	@Autowired
	private IBookManageDao iBookManageDao;
	
	@Override
	public void bookInsert(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

}
