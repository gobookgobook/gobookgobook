package com.gobook.userorder.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.userorder.dao.IUserOrderDao;
import com.gobook.userorder.dto.UserOrderDto;


@Component
public class UserOrderService implements IUserOrderService{
	
	@Autowired
	private IUserOrderDao iUserOrderDao;


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
		
		/*//원래 주석 처리된 코드가 들어가는 것이 맞으 (로그인 된 회원의 아이디를 이용하여 주문 리스트 뿌리기)
		
		int count =iUserOrderDao.userOrderCount(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "count:" +count);
		
		int sum=0;
		
		List<UserOrderDto> userOrderList=null;
		if(count >0){
			userOrderList=iUserOrderDao.userOrderList(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + "userOrderList Size:"+userOrderList.size());
		}
		
		mav.addObject("userOrderList", userOrderList);
		mav.addObject("count", count);
		mav.addObject("sum",sum);
		mav.setViewName("userOrder/userOrderList");*/
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
