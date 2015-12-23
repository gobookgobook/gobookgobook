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

/**
 * @클래스이름 : EventController
 * @날짜 : 2015. 12. 9.
 * @개발자 : 김재석
 * @설명 : 이벤트 Controller
 */
@Controller
public class EventController {
	
	@Autowired
	private IEventService iEventService;
	
	/**
	 * @함수이름 : eventWrite
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 등록
	 */
	@RequestMapping(value="/event/eventWrite.do", method=RequestMethod.GET)
	public ModelAndView eventWrite(HttpServletRequest request, HttpServletResponse response){	
		return new ModelAndView("event/eventWrite");
	}
	
	/**
	 * @함수이름 : eventWriteOk
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 등록완료
	 */
	@RequestMapping(value="/event/eventWrite.do", method=RequestMethod.POST)
	public ModelAndView eventWriteOk(HttpServletRequest request, HttpServletResponse response, EventDto eventDto){
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("eventDto",eventDto);
		iEventService.eventWriteOk(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : eventList
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 목록
	 */
	@RequestMapping(value="/event/eventList.do", method=RequestMethod.GET)
	public ModelAndView eventList(HttpServletRequest request,HttpServletResponse response){
		
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		iEventService.eventList(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : eventRead
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 읽기
	 */
	@RequestMapping(value="/event/eventRead.do", method=RequestMethod.GET)
	public ModelAndView eventRead(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("response",response);
		iEventService.eventRead(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : eventUpdate
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 수정
	 */
	@RequestMapping(value="/event/eventUpdate.do", method=RequestMethod.GET)
	public ModelAndView eventUpdate(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		iEventService.eventUpdate(mav);
		return mav;
	}
	/**
	 * @함수이름 : eventUpdateOk
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 수정완료
	 */
	@RequestMapping(value="/event/eventUpdate.do", method=RequestMethod.POST)
	public ModelAndView eventUpdateOk(HttpServletRequest request,HttpServletResponse response,EventDto eventDto)throws Exception{
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("eventDto",eventDto);
		iEventService.eventUpdateOk(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : eventDelete
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 김재석
	 * @설명 : 이벤트 삭제
	 */
	@RequestMapping(value="/event/eventDelete.do", method=RequestMethod.GET)
	public ModelAndView eventDelete(HttpServletRequest request,HttpServletResponse response,EventDto eventDto)throws Exception{
		ModelAndView mav= new ModelAndView();
		mav.addObject("request",request);
		iEventService.eventDelete(mav);
		return mav;
	}
	
	

}
