package com.gobook.event.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.event.dao.IEventDao;
import com.gobook.event.dto.EventDto;

@Component
public class EventService implements IEventService {
	
	@Autowired
	private IEventDao iEventDao;
	
}
