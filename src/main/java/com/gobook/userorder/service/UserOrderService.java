package com.gobook.userorder.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.member.dao.IMemberDao;
import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.mybasket.dao.IMyBasketDao;
import com.gobook.mybasket.dto.MyBasketDto;
import com.gobook.userorder.dao.IUserOrderDao;
import com.gobook.userorder.dto.UserOrderDto;


@Component
public class UserOrderService implements IUserOrderService{
	
	@Autowired
	private IUserOrderDao iUserOrderDao;
	
	@Autowired
	private IMyBasketDao iMyBasketDao;
	
	@Autowired
	private IMemberDao iMemberDao;


	/**
	 * @클래스이름 : UserOrderList
	 * @날짜 : 2015. 12. 8.
	 * @개발자 : 김재석
	 * @설명 : 주문 리스트
	 */
	@Override
	public void userOrderList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession idSession=request.getSession();
		String member_id=(String) idSession.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		if(member_id !=null){
			HttpSession basketSession=request.getSession();
			
			basketSession.setAttribute("purchase", "basket");
			basketSession.setMaxInactiveInterval(60*60);	// 세션 시간:1시간
			
			String purchase=(String) basketSession.getAttribute("purchase");
			GoBookAspect.logger.info(GoBookAspect.logMsg + purchase);
			
			int basketOrderCount=iMyBasketDao.myBasketCount(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + "basketOrderCount:" +basketOrderCount);
			
			int sum=0;
			
			List<MyBasketDto> myBasketOrderList=null;
			if(basketOrderCount > 0){
				myBasketOrderList=iMyBasketDao.myBasketList(member_id);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "myBasketOrderList:"+myBasketOrderList);
			}
			
			MemberDto memberDto=iMemberDao.memberSelect(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + memberDto);
			
			mav.addObject("memberDto", memberDto);
			mav.addObject("myBasketOrderList", myBasketOrderList);
			mav.addObject("basketOrderCount", basketOrderCount);
			mav.addObject("sum",sum);
		}

		mav.setViewName("userOrder/userOrderList");
	}

	
	/**
	 * @클래스이름 : UserOrderPay
	 * @날짜 : 2015. 12. 8.
	 * @개발자 : 김재석
	 * @설명 : 주문 결제
	 */
	@Override
	public void userOrderPay(ModelAndView mav) {
		Map<String,Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		UserOrderDto userorderDto=(UserOrderDto) map.get("userorderDto");
		
		int check=iUserOrderDao.userOrderListOk(userorderDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + check);
		
		mav.addObject("check", check);
		mav.setViewName("userOrder/userOrderListOk");
	}

	/**
	 * @클래스이름 : UserOrderCouponList
	 * @날짜 : 2015. 12. 9.
	 * @개발자 : 김재석
	 * @설명 : 사용자 주문시 쿠폰적용 리스트
	 */
	@Override
	public void userOrderCouponList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("member_id");
		
		List<UserCouponDto> couponSelect=iUserOrderDao.userOrderCouponListSelect(member_id);
		
	}

}
