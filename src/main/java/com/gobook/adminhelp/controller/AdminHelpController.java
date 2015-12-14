package com.gobook.adminhelp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.adminhelp.service.IAdminHelpService;
import com.gobook.help.dto.HelpNoticeDto;
import com.gobook.help.dto.HelpQnADto;
@Controller
public class AdminHelpController {
	@Autowired
	private IAdminHelpService iAdminHelpService;
	
	@RequestMapping(value="/help/adminHelpQnAWrite.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpQnAWrite(mav);
		return mav;
		
	}
	@RequestMapping(value="/help/adminHelpQnAWrite.do", method=RequestMethod.POST)
	public ModelAndView adminHelpQnAWriteOk(HttpServletRequest request, HttpServletResponse response, HelpQnADto helpQnADto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("helpQnADto", helpQnADto);
		
		iAdminHelpService.adminHelpQnAWriteOk(mav);
		return mav;	
	}
	
	@RequestMapping(value="/help/adminHelpQnAList.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpQnAListSelect(mav);
		return mav;
	}
	@RequestMapping(value="/help/adminHelpQnARead.do", method=RequestMethod.GET)
	public ModelAndView adminQnARead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iAdminHelpService.adminHelpQnARead(mav);
		
		return mav;
	}
	@RequestMapping(value="/help/adminHelpQnADelete.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnADelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		//System.out.println("OK");
		iAdminHelpService.adminHelpQnADelete(mav);
		return mav;
	}
	@RequestMapping(value="/help/adminHelpQnAUpdate.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iAdminHelpService.adminHelpQnAUpdate(mav);
		return mav;
	}
	@RequestMapping(value="/help/adminHelpQnAUpdate.do", method=RequestMethod.POST)
	public ModelAndView adminHelpQnAUpdateOk(HttpServletRequest request, HttpServletResponse response, HelpQnADto helpQnADto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("helpQnADto", helpQnADto);
		iAdminHelpService.adminHelpQnAUpdateOk(mav);
		return mav;	
	}
	@RequestMapping(value="/help/adminHelpNoticeWrite.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeWrite(HttpServletRequest request, HttpServletResponse response){
		
		//System.out.println("ok2");
		return new ModelAndView("help/adminHelpNoticeWrite");
	}
	
	@RequestMapping(value="/help/adminHelpNoticeWrite.do", method=RequestMethod.POST)
	public ModelAndView adminHelpNoticeWriteOk(HttpServletRequest request, HttpServletResponse response, HelpNoticeDto helpNoticeDto){
		//System.out.println("OK");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("helpNoticeDto", helpNoticeDto);
		iAdminHelpService.adminHelpNoticeWriteOk(mav);
		return mav;
	}
	@RequestMapping(value="/help/adminHelpNoticeList.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeList(mav);
		return mav;
		
	}
	@RequestMapping(value="/help/adminHelpNoticeRead.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeRead(mav);
		
		return mav;	
	}
	@RequestMapping(value="/help/adminHelpNoticeDelete.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeDelete(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("OK");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeDelete(mav);
		return mav;
	}
	@RequestMapping(value="/help/adminHelpNoticeUpdate.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeUpdate(mav);
		return mav;
	}
	@RequestMapping(value="/help/adminHelpNoticeUpdate.do", method=RequestMethod.POST)
	public ModelAndView adminHelpNoticeUpdateOk(HttpServletRequest request, HttpServletResponse response, HelpNoticeDto helpNoticeDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("helpNoticeDto", helpNoticeDto);
		
		iAdminHelpService.adminHelpNoticeUpdateOk(mav);
		return mav;	
	}
	
}
