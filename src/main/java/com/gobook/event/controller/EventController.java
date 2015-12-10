package com.gobook.event.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.event.dto.EventDto;
import com.gobook.event.service.EventService;
import com.gobook.event.service.IEventService;

@Controller
public class EventController {
	
	@Autowired
	private IEventService iEventService;
	
	@RequestMapping(value="/event/eventWrite.do", method=RequestMethod.GET)
	public ModelAndView eventWrite(HttpServletRequest request, HttpServletResponse response){	
		return new ModelAndView("event/eventWrite");
	}
	
	@RequestMapping(value="/event/eventWrite.do", method=RequestMethod.POST)
	public ModelAndView eventWriteOk(HttpServletRequest request, HttpServletResponse response, EventDto eventDto){
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("eventDto",eventDto);
		iEventService.eventWriteOk(mav);
		
		return mav;
	}
	@RequestMapping(value="/event/eventList.do", method=RequestMethod.GET)
	public ModelAndView eventList(HttpServletRequest request,HttpServletResponse response){
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		iEventService.eventList(mav);
		return mav;
	}
	
	@RequestMapping(value="/event/eventRead.do", method=RequestMethod.GET)
	public ModelAndView eventRead(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		iEventService.eventRead(mav);
		return mav;
	}

}
