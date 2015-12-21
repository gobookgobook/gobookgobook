package com.gobook.userhelp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.help.dto.HelpNoticeDto;
import com.gobook.help.dto.HelpPvPDto;
import com.gobook.help.dto.HelpQnADto;
import com.gobook.location.dto.LocationDto;
import com.gobook.userhelp.dao.IUserHelpDao;
@Component
public class UserHelpService implements IUserHelpService {
	@Autowired
	private IUserHelpDao iUserHelpDao;

	@Override
	public void userHelpPvP(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HelpPvPDto helpPvPDto=(HelpPvPDto) hmap.get("helpPvPDto");
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		HttpSession session= request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + "member_id:" +member_id);
		
		String helppvp_user_subject=(request.getParameter("helppvp_user_subject"));
		String helppvp_user_content=(request.getParameter("helppvp_user_content"));
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("helppvp_user_subject", helppvp_user_subject);
		map.put("helppvp_user_content", helppvp_user_content);
		
		int check=iUserHelpDao.userHelpPvPInsert(map);
		
		mav.addObject("member_id", member_id);
		mav.addObject("helpPvPDto", helpPvPDto);
		mav.addObject("check", check);
		
		mav.setViewName("userHelp/userHelpPvPOk");
			
	}

	@Override
	public void userHelpQnAList(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int boardSize=5;
		String pageNumber=request.getParameter("pageNumber");
		
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iUserHelpDao.userHelpQnACount();
		GoBookAspect.logger.info(GoBookAspect.logMsg + "count:" + count);
		
		List<HelpQnADto> userHelpQnAList=null;
		if(count > 0){
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			userHelpQnAList=iUserHelpDao.userHelpQnASelect(startRow, endRow);
			GoBookAspect.logger.info(GoBookAspect.logMsg + userHelpQnAList.size());
			
			mav.addObject("currentPage", currentPage);
			mav.addObject("count", count);
			mav.addObject("boardSize", boardSize);
			
			
			
		}
		mav.addObject("userHelpQnAList", userHelpQnAList);
		mav.setViewName("userHelp/userHelpQnA");
	}

	@Override
	public void userHelpQnARead(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpqna_num=Integer.parseInt(request.getParameter("helpqna_num"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + helpqna_num + "\t" + pageNumber);
		
		HelpQnADto helpQnADto=iUserHelpDao.userHelpQnARead(helpqna_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + helpQnADto);
		
		mav.addObject("helpQnADto", helpQnADto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("userHelp/userHelpQnARead");
		
	}

	@Override
	public void userHelpNoticeList(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int boardSize=5;
		String pageNumber=request.getParameter("pageNumber");
		
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iUserHelpDao.userHelpNoticeCount();
		GoBookAspect.logger.info(GoBookAspect.logMsg + "count:" + count);
		
		List<HelpNoticeDto> userHelpNoticeList=null;
		if(count > 0){
			HashMap<String, Integer> map=new HashMap<String, Integer>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			userHelpNoticeList=iUserHelpDao.userHelpNoticeSelect(startRow, endRow);
			GoBookAspect.logger.info(GoBookAspect.logMsg + userHelpNoticeList.size());
			
		}
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("userHelpNoticeList", userHelpNoticeList);
		mav.addObject("count", count);
		mav.setViewName("userHelp/userHelpNotice");
	}

	@Override
	public void userHelpNoticeRead(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpnotice_num=Integer.parseInt(request.getParameter("helpnotice_num"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + helpnotice_num + "\t" + pageNumber);
		
		HelpNoticeDto helpNoticeDto=iUserHelpDao.userHelpNoticeRead(helpnotice_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + helpNoticeDto);
		
		mav.addObject("helpNoticeDto", helpNoticeDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("userHelp/userHelpNoticeRead");
		
	}

	/**
	 * @함수이름 : userHelpLocation
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 오프라인 지점 안내
	 */
	@Override
	public void userHelpLocation(ModelAndView mav) {
		List<LocationDto> locationList = null;
		locationList=iUserHelpDao.userHelpLocation();
		GoBookAspect.logger.info(GoBookAspect.logMsg + locationList.size());
		
		mav.addObject("locationList",locationList);
		mav.addObject("count",locationList.size());
		mav.setViewName("userHelp/userHelpLocation");
	}
}
