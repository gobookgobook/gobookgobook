package com.gobook.event.service;

import org.springframework.web.servlet.ModelAndView;

public interface IEventService {

	public void eventWriteOk(ModelAndView mav);
	
	public void eventList(ModelAndView mav);
	
	public void eventRead(ModelAndView mav);
	
	public void eventUpdate(ModelAndView mav);
	
	public void eventUpdateOk(ModelAndView mav);
	
	public void eventDelete(ModelAndView mav);
	
	
}
