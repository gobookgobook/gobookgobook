package com.gobook.sales.service;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.sales.dao.ISalesDao;
import com.gobook.sales.dto.SalesDailyDto;
import com.gobook.sales.dto.SalesMonthlyDto;

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
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		HttpSession session=request.getSession();
		String member_id="admin";			// 원래는 세션에 있는 아이디를 받아서 admin인지 파악해야 하지만 테스트 편의상 admin을 넣어놓음
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		if(member_id =="admin"){
			String date=request.getParameter("salesdaily_date");
	
			if(date !=null){
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
				SimpleDateFormat sdf2=new SimpleDateFormat("yy/MM/dd HH:mm:ss");
				SimpleDateFormat sdf3=new SimpleDateFormat("yyyyMMdd");
				
				Date salesdaily_date=null;
				Date next_date=null;
				
				StringTokenizer stok=new StringTokenizer(date, "/");
				String stokDate="";
				while(stok.hasMoreTokens()){
					stokDate+=stok.nextToken();
				}
				GoBookAspect.logger.info(GoBookAspect.logMsg + "stokDate:"+stokDate);
				int plusDate=Integer.parseInt(stokDate)+1;
				String nextDate=Integer.toString(plusDate);
				//GoBookAspect.logger.info(GoBookAspect.logMsg + "plusDate:"+plusDate);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "nextDate:"+nextDate);
				
				try{
					salesdaily_date=(Date) sdf.parse(date);		// String -> Date 형변환
					next_date=(Date) sdf3.parse(nextDate);
				}catch(ParseException e){
					e.printStackTrace();
				}
				
				GoBookAspect.logger.info(GoBookAspect.logMsg + "After_salesdaily_date:"+(sdf2.format(salesdaily_date)));
				GoBookAspect.logger.info(GoBookAspect.logMsg + "next_date:"+(sdf2.format(next_date)));
				
				int calculCount=iSalesDao.salesCalculCount(sdf.format(salesdaily_date));
				GoBookAspect.logger.info(GoBookAspect.logMsg + "calculCount:"+calculCount);
				
				int count=iSalesDao.salesDailyCount(sdf2.format(salesdaily_date), sdf2.format(next_date));
				GoBookAspect.logger.info(GoBookAspect.logMsg + "count:"+count);
				
				List<SalesDailyDto> salesDailyList=null;
				if(count > 0){
					salesDailyList=iSalesDao.salesDailyList(sdf2.format(salesdaily_date), sdf2.format(next_date));
					GoBookAspect.logger.info(GoBookAspect.logMsg + "salesDailyList:"+salesDailyList);
					
					int dailySum=0;			// 일일매출
					int dailyProfit=0;		// 일일순이익
					for(int i=0;i<salesDailyList.size();i++){
						dailySum+=salesDailyList.get(i).getSalesdaily_total();
						dailyProfit+=salesDailyList.get(i).getSalesdaily_profit();
					}
					
					GoBookAspect.logger.info(GoBookAspect.logMsg + "dailySum:"+dailySum);
					GoBookAspect.logger.info(GoBookAspect.logMsg + "dailyProfit:"+dailyProfit);
					
					mav.addObject("salesDailyList", salesDailyList);
					mav.addObject("calculCount", calculCount);
					mav.addObject("count", count);
					mav.addObject("dailySum", dailySum);
					mav.addObject("dailyProfit", dailyProfit);
					
					/*try{
						String str=dailySum + "," + dailyProfit;
						GoBookAspect.logger.info(GoBookAspect.logMsg + "str:" + str);
						response.setContentType("application/html;charset=utf-8");
						PrintWriter out=response.getWriter();
						out.print(str);
					}catch(IOException e){
						e.printStackTrace();
					}*/
				}else{
					mav.addObject("count", count);
					mav.addObject("calculCount", calculCount);
				}
			}else{
				/*List<SalesDailyDto> salesDailyList=null;
				if(count > 0){
					salesDailyList=iSalesDao.salesDailyList();
					GoBookAspect.logger.info(GoBookAspect.logMsg + "salesDailyList:"+salesDailyList);
				}
				
				mav.addObject("salesDailyList", salesDailyList);
				mav.addObject("count", count);
				mav.addObject("dailySum", dailySum);
				mav.addObject("dailyProfit", dailyProfit);*/
			}
		}
		mav.setViewName("sales/salesDailyList");
	}

	/**
	 * @함수이름 : salesMonthlyInsert
	 * @작성일 : 2015. 12. 14.
	 * @개발자 : 황규성
	 * @설명 : 월별매출 삽입
	 */
	@Override
	public void salesMonthlyInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		// GoBookAspect.logger.info(GoBookAspect.logMsg + "OK");

		int daily_sum=Integer.parseInt(request.getParameter("daily_sum"));
		int daily_profit=Integer.parseInt(request.getParameter("daily_profit"));
		String salesmonthly_date=request.getParameter("salesmonthly_date");
		GoBookAspect.logger.info(GoBookAspect.logMsg + "salesmonthly_date:" + salesmonthly_date);
		int count=iSalesDao.salesMonthlyInsert(daily_sum, daily_profit, salesmonthly_date);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "count:" + count);
		
		mav.addObject("count", count);
		mav.setViewName("sales/salesMonthlyInsert");
	}

	/**
	 * @함수이름 : salesMonthlyList
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 황규성
	 * @설명 : 월별매출 내역
	 */
	@Override
	public void salesMonthlyList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		
		HttpSession session=request.getSession();
		String member_id="admin";			// 원래는 세션에 있는 아이디를 받아서 admin인지 파악해야 하지만 테스트 편의상 admin을 넣어놓음
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		if(member_id =="admin"){
			try{
				int year=Integer.parseInt(request.getParameter("monthly_year"));
				int month=Integer.parseInt(request.getParameter("monthly_month"));
				
				String start=year+"/"+month+"/01";
				String end=null;
				
				if(month==4 || month==6 || month==9 || month==11){
					end=year+"/"+month+"/30";
				}else if(month==2 && year%100!=0 && year%4==0){
					end=year+"/"+month+"/29";
				}else{
					end=year+"/"+month+"/31";
				}
				
				GoBookAspect.logger.info(GoBookAspect.logMsg + "start:"+start);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "end:"+end);
				
				int count=iSalesDao.salesMonthlyCount(start, end);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "count:"+count);
				
				List<SalesMonthlyDto> salesMonthlyList=null;
				if(count > 0){
					salesMonthlyList=iSalesDao.salesMonthlyList(start, end);
					GoBookAspect.logger.info(GoBookAspect.logMsg + "salesMonthlyList:"+salesMonthlyList.size());
					
					int monthlySum=0;			// 월별매출총합
					int monthlyProfit=0;		// 월별순이익총합
					int monthlyOrderSum=0;		// 월별입고총합
					for(int i=0;i<salesMonthlyList.size();i++){
						monthlySum+=salesMonthlyList.get(i).getSalesmonthly_daily_sale();
						monthlyProfit+=salesMonthlyList.get(i).getSalesmonthly_daily_profit();
						monthlyOrderSum+=salesMonthlyList.get(i).getSalesmonthly_order_totalprice();
					}
					
					GoBookAspect.logger.info(GoBookAspect.logMsg + "monthlySum:"+monthlySum);
					GoBookAspect.logger.info(GoBookAspect.logMsg + "monthlyProfit:"+monthlyProfit);
					GoBookAspect.logger.info(GoBookAspect.logMsg + "monthlyOrderSum:"+monthlyOrderSum);
					
					mav.addObject("salesMonthlyList", salesMonthlyList);
					mav.addObject("count", count);
				}else{
					mav.addObject("count", count);
				}
			}catch(Exception e){}
		}
		mav.setViewName("sales/salesMonthlyList");
	}
}
