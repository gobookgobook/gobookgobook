package com.gobook.location.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.location.dto.LocationDto;
import com.gobook.location.service.ILocationService;

/**
 * @클래스이름 : LocationController
 * @날짜 : 2015. 12. 9.
 * @개발자 : 강주혁
 * @설명 : 지점관리 Controller
 */
@Controller
public class LocationController {
	@Autowired
	private ILocationService ILocationService;
	
	/**
	 * @함수이름 : locationWrite
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 강주혁
	 * @설명 : 지점등록 페이지로 이동
	 */
	@RequestMapping(value="/location/locationWrite.do", method=RequestMethod.GET)
	public ModelAndView locationWrite(HttpServletRequest request, HttpServletResponse response){
		return new ModelAndView("/location/locationWrite");
	}
	
	/**
	 * @함수이름 : locationWriteOk
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 강주혁
	 * @설명 : 지점등록
	 */
	@RequestMapping(value="/location/locationWrite.do", method=RequestMethod.POST)
	public ModelAndView locationWriteOk(HttpServletRequest request, HttpServletResponse response, LocationDto locationDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("locationDto", locationDto);
		ILocationService.locationWrite(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : locationWriteOk
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 강주혁
	 * @설명 : 지점목록
	 */
	@RequestMapping(value="/location/locationList.do", method=RequestMethod.GET)
	public ModelAndView locationWriteOk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		ILocationService.locationList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : locationUpdate
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 지점 정보가져오기
	 */
	@RequestMapping(value="/location/locationUpdate.do", method=RequestMethod.GET)
	public ModelAndView locationUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		ILocationService.locationUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : locationUpdateOk
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 지점 정보 수정
	 */
	@RequestMapping(value="/location/locationUpdate.do", method=RequestMethod.POST)
	public ModelAndView locationUpdateOk(HttpServletRequest request, HttpServletResponse response, LocationDto locationDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("locationDto", locationDto);
		ILocationService.locationUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : locationDelete
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 지점삭제
	 */
	@RequestMapping(value="/location/locationDelete.do", method=RequestMethod.GET)
	public ModelAndView locationDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		ILocationService.locationDelete(mav);
		
		return mav;
	}
}
