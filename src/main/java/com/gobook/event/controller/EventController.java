package com.gobook.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.event.service.IEventService;

@Controller
public class EventController {
	
	@Autowired
	private IEventService iEventService;
	
	@RequestMapping(value="/event/eventWrite.do", method=RequestMethod.GET)
	public ModelAndView eventWrite(HttpServletRequest request, HttpServletResponse response){	
		return new ModelAndView("event/eventWrite");
	}
	
	

}
