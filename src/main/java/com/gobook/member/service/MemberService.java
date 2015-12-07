package com.gobook.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.member.dao.IMemberDao;
import com.gobook.member.dto.ZipcodeDto;

@Component
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao iMemberDao;

	@Override
	public void zipcode(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String dong=request.getParameter("dong");
		
		if(dong !=null && dong !=""){
			GoBookAspect.logger.info(GoBookAspect.logMsg + dong);
			
			List<ZipcodeDto> zipcode=iMemberDao.zipcode(dong);
			GoBookAspect.logger.info(GoBookAspect.logMsg + zipcode.size());
			mav.addObject("zipcode", zipcode);
		}
		
		mav.setViewName("member/zipcode");
	}
}
