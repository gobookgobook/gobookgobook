package com.gobook.sales.service;

import java.util.Date;
import java.io.IOException;
import java.io.PrintWriter;
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
		
		//GoBookAspect.logger.info(GoBookAspect.logMsg + "OK");
		
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
}
