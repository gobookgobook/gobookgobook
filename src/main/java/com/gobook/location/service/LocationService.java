package com.gobook.location.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.location.dao.ILocationDao;
import com.gobook.location.dto.LocationDto;
import com.gobook.member.dto.ZipcodeDto;

/**
 * @클래스이름 : LocationService
 * @날짜 : 2015. 12. 10.
 * @개발자 : 강주혁
 * @설명 : 지점관리 Service
 */
@Component
public class LocationService implements ILocationService {

	@Autowired
	private ILocationDao iLocationDao;

	/**
	 * @함수이름 : locationWrite
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 강주혁
	 * @설명 : 지점등록
	 */
	@Override
	public void locationWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		LocationDto locationDto=(LocationDto) map.get("locationDto");
		
		int check=iLocationDao.locationWriteInsert(locationDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("location/locationWriteOk");
	}

	/**
	 * @함수이름 : locationList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 강주혁
	 * @설명 : 지점목록
	 */
	@Override
	public void locationList(ModelAndView mav) {
		List<LocationDto> locationList = null;
		locationList=iLocationDao.locationSelect();
		GoBookAspect.logger.info(GoBookAspect.logMsg + locationList.size());
		
		mav.addObject("locationList",locationList);
		mav.addObject("count",locationList.size());
		mav.setViewName("location/locationList");
	}
}
