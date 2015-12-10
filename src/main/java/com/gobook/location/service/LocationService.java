package com.gobook.location.service;

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
	 * @함수이름 : zipcode
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 강주혁
	 * @설명 : 주소검색
	 */
	@Override
	public void zipcode(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String dong=request.getParameter("dong");
		
		if(dong !=null && dong !=""){
			GoBookAspect.logger.info(GoBookAspect.logMsg + dong);
			
			List<ZipcodeDto> zipcode=iLocationDao.zipcode(dong);
			GoBookAspect.logger.info(GoBookAspect.logMsg + zipcode.size());
			mav.addObject("zipcode", zipcode);
		}
		
		mav.setViewName("location/zipcode");
	}

	@Override
	public void locationWrite(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		LocationDto locationDto=(LocationDto) map.get("locationDto");
		
		int check=iLocationDao.locationWriteInsert(locationDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("location/locationWriteOk");
	}
}
