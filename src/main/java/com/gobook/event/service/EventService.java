package com.gobook.event.service;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
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
		    
	      MultipartFile upFile= request.getFile("event_file");
	      String event_file_name= Long.toString(System.currentTimeMillis()) + "_"+upFile.getOriginalFilename();
	      long event_file_size=upFile.getSize();
	      GoBookAspect.logger.info(GoBookAspect.logMsg+ event_file_name +"," +event_file_size); 
	      
	      if(event_file_size !=0){
	    	  File path= new File("C:\\gobook\\workspace\\gobookgobook\\src\\main\\webapp\\css\\event\\images");
	    	  path.mkdir();
	    	  if(path.exists() && path.isDirectory()){
	    		  File file= new File(path,event_file_name);
	    		  try{
	    			  upFile.transferTo(file);
	    			  
	    			  eventDto.setEvent_file_name(event_file_name);
	    			  eventDto.setEvent_file_size(event_file_size);
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
		GoBookAspect.logger.info(GoBookAspect.logMsg+ event_bunho); 
		
		EventDto eventDto=iEventDao.eventRead(event_bunho);
		GoBookAspect.logger.info(GoBookAspect.logMsg+ eventDto); 
		
		if(eventDto.getEvent_file_name() != null){
		int index=eventDto.getEvent_file_name().indexOf("_")+1;
		eventDto.setEvent_file_name(eventDto.getEvent_file_name().substring(index));	
		}
		mav.addObject("eventDto",eventDto);
		mav.setViewName("event/eventRead");
	}

	@Override
	public void eventUpdate(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int event_bunho=Integer.parseInt(request.getParameter("event_bunho"));
		
		EventDto eventDto= iEventDao.eventSelect(event_bunho);
		GoBookAspect.logger.info(GoBookAspect.logMsg+ eventDto); 
		
		String event_file_name=null;
		if(eventDto.getEvent_file_name() !=null){
			int index=eventDto.getEvent_file_name().indexOf("_")+1;
			event_file_name= eventDto.getEvent_file_name().substring(index);
		}
		mav.addObject("event_bunho",event_bunho);
		mav.addObject("eventDto",eventDto);
		mav.addObject("event_file_name",event_file_name);
		
		mav.setViewName("event/eventUpdate");
	}

	@Override
	public void eventUpdateOk(ModelAndView mav){
		Map<String, Object> map= mav.getModelMap();
		EventDto eventDto=(EventDto)map.get("eventDto");
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		
		MultipartFile event_file= request.getFile("event_file");
		GoBookAspect.logger.info(GoBookAspect.logMsg + "event_file:"+event_file);
		String event_file_name= event_file.getOriginalFilename();
		long event_file_size= event_file.getSize();
		System.out.println("event_file_name:"+event_file_name);
		if(event_file_size !=0){
			File path=new File("C:/eventpicture modify/");
			path.mkdirs();
			
			if(path.exists() && path.isDirectory()){
				File file= new File(path,event_file_name);
				try{
					event_file.transferTo(file);
					eventDto.setEvent_file_name(event_file_name);
					eventDto.setEvent_file_path(file.getAbsolutePath());
					eventDto.setEvent_file_size(event_file_size);
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
	
      int check=iEventDao.eventUpdate(eventDto);
      GoBookAspect.logger.info(GoBookAspect.logMsg+ check);
      mav.addObject("check",check);
      mav.setViewName("event/eventUpdateOk");
    }

	@Override
	public void eventDelete(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int event_bunho=Integer.parseInt(request.getParameter("event_bunho"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + event_bunho);
		
		int check=iEventDao.eventDelete(event_bunho);
		
		mav.addObject("event_bunho",event_bunho);
		mav.addObject("check",check);
		mav.setViewName("event/eventDelete");
	}

	


}