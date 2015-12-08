package com.gobook.userorder.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.userorder.dao.IUserOrderDao;
import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : UserOrderService
 * @날짜 : 2015-12-08
 * @개발자 : 김재석
 * @설명 : 
 */

@Component
public class UserOrderService implements IUserOrderService{
	
	@Autowired
	private IUserOrderDao iUserOrderDao;

	@Override
	public void userOrderList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int count =iUserOrderDao.getUserOrderCount();
		GoBookAspect.logger.info(GoBookAspect.logMsg + "count:" +count);
		
		int sum=0;
		
		List<UserOrderDto> userOrderList=null;
		if(count >0){
			userOrderList=iUserOrderDao.getUserOrderList();
			GoBookAspect.logger.info(GoBookAspect.logMsg + "userOrderList Size:"+userOrderList.size());
		}
		
		mav.addObject("userOrderList", userOrderList);
		mav.addObject("count", count);
		mav.addObject("sum",sum);
		mav.setViewName("userOrder/userOrderList");
	}

	@Override
	public void userOrderPay(ModelAndView mav) {
		// TODO Auto-generated method stub
		
	}

}
