package com.gobook.mypage.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
//import com.gobook.help.dto.HelpPvPDto;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.mypage.dao.IMyPageDao;
import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : MyPageService
 * @날짜 : 2015. 12. 11.
 * @개발자 : 오주석
 * @설명 : 
 */
@Component
public class MyPageService implements IMyPageService {

	@Autowired
	private IMyPageDao iMyPageDao;

	/**
	 * @함수이름 : myPageOrderList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public void myPageOrderList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);

		if(member_id !=null){
			
		int count=iMyPageDao.myPageOrderCount(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + count);
		List<UserOrderDto> userOrderDto=null;
		
		if(count >0){
			userOrderDto=iMyPageDao.myPageOrderListSelect(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + userOrderDto.toString());
		}
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int boardSize=3;
		
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
	
		List<UserOrderDto> userOrderlist=null;
		
		if(count > 0){
			userOrderlist=iMyPageDao.myPageHistoryListSelect(startRow, endRow, member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + userOrderlist.size());
		}

		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("userOrderlist", userOrderlist);
		mav.addObject("userOrderDto", userOrderDto);
		}
		mav.setViewName("myPage/myPageOrderList");
		
	}

	
	/**
	 * @함수이름 : myPageCoupon
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public void myPageCoupon(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		List<UserCouponDto> couponSelect=null;
		
		if(member_id !=null){
			couponSelect=iMyPageDao.myPageCouponSelect(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + couponSelect.size());
			GoBookAspect.logger.info(GoBookAspect.logMsg + couponSelect);
		}
		mav.addObject("couponSelect", couponSelect);
		mav.setViewName("myPage/myPageCoupon");
	}


	/**
	 * @함수이름 : myPagePoint
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
	@Override
	public void myPagePoint(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		int member_point=0;
		if(member_id !=null){
			member_point=iMyPageDao.myPagePointSelect(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + member_point);
		}
		mav.addObject("member_point", member_point);
		mav.setViewName("myPage/myPagePoint");
		
	}

	/**
	 * @함수이름 : myPagePvPList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
/*	@Override
	public void myPagePvPList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		List<HelpPvPDto> myPagePvPList=iMyPageDao.myPagePvPListSelect(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + myPagePvPList.size());
		
		mav.addObject("myPagePvPList", myPagePvPList);
		mav.setViewName("myPage/myPagePvPList");
		
	}*/


	/**
	 * @함수이름 : myPagePvPRead
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 오주석
	 * @설명 : 
	 */
/*	@Override
	public void myPagePvPRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int helppvp_num=Integer.parseInt(request.getParameter("helppvp_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + "번호:" + helppvp_num);
		
		HelpPvPDto helpPvPDto=iMyPageDao.myPagePvPRead(helppvp_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + helpPvPDto);
		
		mav.addObject("helpPvPDto", helpPvPDto);
		mav.setViewName("myPage/myPagePvPRead");
		
	}
*/
}
