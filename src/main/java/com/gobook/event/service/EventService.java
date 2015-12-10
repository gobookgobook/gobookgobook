package com.gobook.event.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.event.dao.IEventDao;
import com.gobook.event.dto.EventDto;

@Component
public class EventService implements IEventService {
	
	@Autowired
	private IEventDao iEventDao;
	

	@Override
	public void eventWriteOk(ModelAndView mav) {
		Map<String,Object> map= mav.getModelMap();
	     EventDto eventDto=(EventDto) map.get("eventDto");
	      MultipartHttpServletRequest request=(MultipartHttpServletRequest) map.get("request");
		    
	      MultipartFile upFile= request.getFile("file");
	      String fileName= Long.toString(System.currentTimeMillis()) + "_"+upFile.getOriginalFilename();
	      long fileSize=upFile.getSize();
	      GoBookAspect.logger.info(GoBookAspect.logMsg+ fileName +"," +fileSize); 
	      
	      if(fileSize !=0){
	    	  File path= new File("C:\\gobook\\workspace\\gobookgobook\\src\\main\\webapp\\css\\event\\images");
	    	  path.mkdir();
	    	  if(path.exists() && path.isDirectory()){
	    		  File file= new File(path,fileName);
	    		  try{
	    			  upFile.transferTo(file);
	    			  
	    			  eventDto.setEvent_file_name(fileName);
	    			  eventDto.setEvent_file_size(fileSize);
	    			  eventDto.setEvent_file_path(file.getAbsolutePath());
	    		  }catch(Exception e){
	    			  e.printStackTrace();
	    		  }
	    	  }
	      }
	      int check=iEventDao.eventWriteInsert(eventDto);
	 
	      int event_bunho=eventDto.getEvent_bunho();
	    
	    mav.addObject("event_bunho",event_bunho);		  
	    mav.addObject("check",check);
	    mav.setViewName("event/eventWriteOk");  
	}

	@Override
	public void eventList(ModelAndView mav) {
		Map<String, Object>map= mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest)  map.get("request");
		
		List<EventDto> eventList=null;
		eventList= iEventDao.eventListSelect();
		GoBookAspect.logger.info(GoBookAspect.logMsg+ eventList.size()); 
		mav.addObject("eventList",eventList);
		mav.setViewName("event/eventList");
	}

	@Override
	public void eventRead(ModelAndView mav) {
		Map<String,Object>map= mav.getModelMap();
		HttpServletRequest request= (HttpServletRequest) map.get("request");
		
		int event_bunho=Integer.parseInt(request.getParameter("event_bunho"));
		EventDto eventDto=iEventDao.eventRead(event_bunho);
		GoBookAspect.logger.info(GoBookAspect.logMsg+ eventDto); 
	}
	
}
