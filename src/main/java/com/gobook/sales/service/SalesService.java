package com.gobook.sales.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.sales.dao.ISalesDao;
import com.gobook.sales.dto.SalesDailyDto;

/**
 * @클래스이름 : SalesService
 * @날짜 : 2015. 12. 11.
 * @개발자 : 황규성
 * @설명 : 매출 Service
 */
@Component
public class SalesService implements ISalesService {
	@Autowired
	private ISalesDao iSalesDao;

	@Override
	public void salesDailyList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		//GoBookAspect.logger.info(GoBookAspect.logMsg + "OK");
		
		HttpSession session=request.getSession();
		String member_id="admin";			// 원래는 세션에 있는 아이디를 받아서 admin인지 파악해야 하지만 테스트 편의상 admin을 넣어놓음
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		if(member_id =="admin"){
			int count=iSalesDao.salesDailyCount();
			GoBookAspect.logger.info(GoBookAspect.logMsg + "count:"+count);
			
			int dailySum=0;			// 일일매출
			int dailyProfit=0;		// 일일순이익
			
			List<SalesDailyDto> salesDailyList=null;
			if(count > 0){
				salesDailyList=iSalesDao.salesDailyList();
				GoBookAspect.logger.info(GoBookAspect.logMsg + "salesDailyList:"+salesDailyList);
			}
			
			mav.addObject("salesDailyList", salesDailyList);
			mav.addObject("count", count);
			mav.addObject("dailySum", dailySum);
			mav.addObject("dailyProfit", dailyProfit);
		}
		mav.setViewName("sales/salesDailyList");
	}
}
