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

/**
 * @클래스이름 : AdminHelpController
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 관리자 고객센터 Controller
 */
@Controller
public class AdminHelpController {
	@Autowired
	private IAdminHelpService iAdminHelpService;
	
	/**
	 * @함수이름 : adminHelpQnAWrite
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 등록
	 */
	@RequestMapping(value="/help/adminHelpQnAWrite.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAWrite(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpQnAWrite(mav);
		return mav;
		
	}
	
	/**
	 * @함수이름 : adminHelpQnAWriteOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 등록 확인
	 */
	@RequestMapping(value="/help/adminHelpQnAWrite.do", method=RequestMethod.POST)
	public ModelAndView adminHelpQnAWriteOk(HttpServletRequest request, HttpServletResponse response, HelpQnADto helpQnADto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("helpQnADto", helpQnADto);
		
		iAdminHelpService.adminHelpQnAWriteOk(mav);
		return mav;	
	}
	
	/**
	 * @함수이름 : adminHelpQnAList
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 목록
	 */
	@RequestMapping(value="/help/adminHelpQnAList.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpQnAList(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : adminQnARead
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 읽기
	 */
	@RequestMapping(value="/help/adminHelpQnARead.do", method=RequestMethod.GET)
	public ModelAndView adminQnARead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iAdminHelpService.adminHelpQnARead(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : adminHelpQnADelete
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 삭제
	 */
	@RequestMapping(value="/help/adminHelpQnADelete.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnADelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		//System.out.println("OK");
		iAdminHelpService.adminHelpQnADelete(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : adminHelpQnAUpdate
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 수정
	 */
	@RequestMapping(value="/help/adminHelpQnAUpdate.do", method=RequestMethod.GET)
	public ModelAndView adminHelpQnAUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iAdminHelpService.adminHelpQnAUpdate(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : adminHelpQnAUpdateOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 수정 확인
	 */
	@RequestMapping(value="/help/adminHelpQnAUpdate.do", method=RequestMethod.POST)
	public ModelAndView adminHelpQnAUpdateOk(HttpServletRequest request, HttpServletResponse response, HelpQnADto helpQnADto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		mav.addObject("helpQnADto", helpQnADto);
		iAdminHelpService.adminHelpQnAUpdateOk(mav);
		return mav;	
	}
	
	/**
	 * @함수이름 : adminHelpNoticeWrite
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 등록
	 */
	@RequestMapping(value="/help/adminHelpNoticeWrite.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeWrite(HttpServletRequest request, HttpServletResponse response){
		
		//System.out.println("ok2");
		return new ModelAndView("help/adminHelpNoticeWrite");
	}
	
	/**
	 * @함수이름 : adminHelpNoticeWriteOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 등록 확인
	 */
	@RequestMapping(value="/help/adminHelpNoticeWrite.do", method=RequestMethod.POST)
	public ModelAndView adminHelpNoticeWriteOk(HttpServletRequest request, HttpServletResponse response, HelpNoticeDto helpNoticeDto){
		//System.out.println("OK");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("helpNoticeDto", helpNoticeDto);
		iAdminHelpService.adminHelpNoticeWriteOk(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : adminHelpNoticeList
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 목록
	 */
	@RequestMapping(value="/help/adminHelpNoticeList.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeList(mav);
		return mav;
		
	}
	
	/**
	 * @함수이름 : adminHelpNoticeRead
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 읽기
	 */
	@RequestMapping(value="/help/adminHelpNoticeRead.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeRead(mav);
		
		return mav;	
	}
	
	/**
	 * @함수이름 : adminHelpNoticeDelete
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 삭제
	 */
	@RequestMapping(value="/help/adminHelpNoticeDelete.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeDelete(HttpServletRequest request, HttpServletResponse response){
		//System.out.println("OK");
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeDelete(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : adminHelpNoticeUpdate
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 수정
	 */
	@RequestMapping(value="/help/adminHelpNoticeUpdate.do", method=RequestMethod.GET)
	public ModelAndView adminHelpNoticeUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iAdminHelpService.adminHelpNoticeUpdate(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : adminHelpNoticeUpdateOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 수정 확인
	 */
	@RequestMapping(value="/help/adminHelpNoticeUpdate.do", method=RequestMethod.POST)
	public ModelAndView adminHelpNoticeUpdateOk(HttpServletRequest request, HttpServletResponse response, HelpNoticeDto helpNoticeDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("helpNoticeDto", helpNoticeDto);
		
		iAdminHelpService.adminHelpNoticeUpdateOk(mav);
		return mav;	
	}
}
