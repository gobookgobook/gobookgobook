package com.gobook.userhelp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.help.dto.HelpPvPDto;
import com.gobook.userhelp.service.IUserHelpService;

/**
 * @클래스이름 : UserHelpController
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 사용자 고객센터 Controller
 */
@Controller
public class UserHelpController {
	@Autowired
	private IUserHelpService iUserHelpService;

	
	@RequestMapping(value="userHelp/userHelpPvP.do", method=RequestMethod.GET)
	public ModelAndView userHelpPvP(HttpServletRequest request, HttpServletResponse response){
		
		return new ModelAndView("userHelp/userHelpPvP");
	}
	@RequestMapping(value="userHelp/userHelpPvP.do", method=RequestMethod.POST)
	public ModelAndView userHelpPvPOk(HttpServletRequest request, HttpServletResponse response, HelpPvPDto helpPvPDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("HelpPvPDto", helpPvPDto);
		
		iUserHelpService.userHelpPvP(mav);
		return mav;	
	}
	
	/**
	 * @함수이름 : userHelpQnA
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 사용자 Q&A 목록
	 */
	@RequestMapping(value="userHelp/userHelpQnA.do", method=RequestMethod.GET)
	public ModelAndView userHelpQnA(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request",request);
		
		iUserHelpService.userHelpQnAList(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : userHelpQnARead
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 사용자 Q&A 읽기
	 */
	@RequestMapping(value="userHelp/userHelpQnARead.do", method=RequestMethod.GET)
	public ModelAndView userHelpQnARead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iUserHelpService.userHelpQnARead(mav);
		return mav;
	}
	
	/**
	 * @함수이름 : userHelpNotice
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 사용자 공지사항 목록
	 */
	@RequestMapping(value="userHelp/userHelpNotice.do", method=RequestMethod.GET)
	public ModelAndView userHelpNotice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iUserHelpService.userHelpNoticeList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : userHelpNoticeRead
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 사용자 공지사항 읽기
	 */
	@RequestMapping(value="userHelp/userHelpNoticeRead.do",method=RequestMethod.GET)
	public ModelAndView userHelpNoticeRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		
		iUserHelpService.userHelpNoticeRead(mav);
		return mav;
		
	}
	
	/**
	 * @함수이름 : userHelpLocation
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 오프라인 지점 가져오기
	 */
	@RequestMapping(value="userHelp/userHelpLocation.do",method=RequestMethod.GET)
	public ModelAndView userHelpLocation(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		iUserHelpService.userHelpLocation(mav);
		
		return mav;
	}
}
