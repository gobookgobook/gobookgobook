package com.gobook.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.member.dto.MemberDto;
import com.gobook.member.service.IMemberService;

/**
 * @클래스이름 : MemberController
 * @날짜 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 회원관리 Controller
 */
@Controller
public class MemberController {
	@Autowired
	private IMemberService iMemberService;
	
	/**
	 * @함수이름 : memberRegister
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원가입창으로 이동
	 */
	@RequestMapping(value="/member/register.do", method=RequestMethod.GET)
	public ModelAndView memberRegister(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("member/register");
	}
	
	/**
	 * @함수이름 : zipcode
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 우편번호 검색
	 */
	@RequestMapping(value="/member/zipcode.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView zipcode(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.zipcode(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : idCheck
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 아이디 중복 체크
	 */
	@RequestMapping(value="/member/idCheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView idCheck(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.memberIdCheck(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberRegisterOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원가입
	 */
	@RequestMapping(value="/member/register.do", method=RequestMethod.POST)
	public ModelAndView memberRegisterOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("memberDto", memberDto);
		iMemberService.memberInsert(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberlogin
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 로그인 페이지로 이동
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public ModelAndView memberlogin(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("member/login");
	}
	
	/**
	 * @함수이름 : memberloginOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 로그인
	 */
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	public ModelAndView memberloginOk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.memberLogin(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : goBookMain
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 메인화면
	 * @수정 : 성기훈(로그인시 관리자 페이지 이동)
	 */
	@RequestMapping(value="/member/goBookMain.do", method=RequestMethod.GET)
	public ModelAndView goBookMain(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.goBookMain(mav);
		
		return mav;
		// return new ModelAndView("member/goBookMain");
	}
	
	/**
	 * @함수이름 : adminMain
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 성기훈
	 * @설명 : 관리자 메인화면
	 */
	@RequestMapping(value="/member/adminMain.do", method=RequestMethod.GET)
	public ModelAndView adminMain(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("member/adminMain");
	}
	
	/**
	 * @함수이름 : memberLogout
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 로그아웃
	 */
	@RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	public ModelAndView memberLogout(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("member/logout");
	}
	
	/**
	 * @함수이름 : memberDelete
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원탈퇴 페이지로 이동
	 */
	@RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
	public ModelAndView memberDelete(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("member/delete");
	}
	
	/**
	 * @함수이름 : memberDeleteOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원탈퇴
	 */
	@RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
	public ModelAndView memberDeleteOk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.memberDeleteOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberUpdate
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 사용자 정보 가져오기
	 */
	@RequestMapping(value="/member/update.do", method=RequestMethod.GET)
	public ModelAndView memberUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iMemberService.memberUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : memberUpdateOk
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 강주혁
	 * @설명 : 회원정보수정
	 */
	@RequestMapping(value="/member/update.do", method=RequestMethod.POST)
	public ModelAndView memberUpdateOk(HttpServletRequest request, HttpServletResponse response, MemberDto memberDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("memberDto", memberDto);
		iMemberService.memberUpdateOk(mav);
		
		return mav;
	}
}
