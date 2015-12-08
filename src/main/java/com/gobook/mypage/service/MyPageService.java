package com.gobook.mypage.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.member.dto.UserCouponDto;
import com.gobook.mypage.dao.IMyPageDao;
import com.gobook.userorder.dto.UserOrderDto;

@Component
public class MyPageService implements IMyPageService {

	@Autowired
	private IMyPageDao iMyPageDao;

	@Override
	public void myPageOrderList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("member_id");
		System.out.println(member_id);
		
		List<UserOrderDto> userOrderDto=iMyPageDao.myPageOrderListSelect(member_id);
		System.out.println(userOrderDto.toString());
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int boardSize=3;
		
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iMyPageDao.myPageOrderCount();
		System.out.println(count);
	
		List<UserOrderDto> userOrderlist=iMyPageDao.myPageHistoryListSelect(startRow, endRow, member_id);
		System.out.println(userOrderlist.size());
		
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("userOrderlist", userOrderlist);
		mav.addObject("userOrderDto", userOrderDto);
		mav.setViewName("myPage/myPageOrderList");
		
	}

	
	@Override
	public void myPageCoupon(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("member_id");
//		System.out.println(member_id);
		
		List<UserCouponDto> couponSelect=iMyPageDao.myPageCouponSelect(member_id);
//		System.out.println(couponSelect.size());

		mav.addObject("couponSelect", couponSelect);
		mav.setViewName("myPage/myPageCoupon");
	}

}
