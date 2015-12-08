package com.gobook.mybasket.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.mybasket.dao.IMyBasketDao;
import com.gobook.mybasket.dto.MyBasketDto;

@Component
public class MyBasketService implements IMyBasketService {
	
	@Autowired
	private IMyBasketDao iMyBasketDao;

	@Override
	public void myBasketList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		int count=iMyBasketDao.getMyBasketCount();
		GoBookAspect.logger.info(GoBookAspect.logMsg + "count:"+count);
		
		int sum=0;
		
		List<MyBasketDto> myBasketList=null;
		if(count > 0){
			myBasketList=iMyBasketDao.getMyBasketList();
			GoBookAspect.logger.info(GoBookAspect.logMsg + "myBasketList Size:"+myBasketList.size());
		}
		
		mav.addObject("myBasketList", myBasketList);
		mav.addObject("count", count);
		mav.addObject("sum",sum);
		mav.setViewName("myBasket/myBasketList");
	}
}