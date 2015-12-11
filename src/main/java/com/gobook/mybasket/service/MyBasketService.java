package com.gobook.mybasket.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.mybasket.dao.IMyBasketDao;
import com.gobook.mybasket.dto.MyBasketDto;

/**
 * @클래스이름 : MyBasketService
 * @날짜 : 2015. 12. 8.
 * @개발자 : 황규성
 * @설명 : 장바구니 Service
 */
@Component
public class MyBasketService implements IMyBasketService {
	
	@Autowired
	private IMyBasketDao iMyBasketDao;

	/**
	 * @함수이름 : myBasketList
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 내역
	 */
	@Override
	public void myBasketList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		if(member_id !=null){
		int count=iMyBasketDao.myBasketCount(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "count:"+count);
		
		int sum=0;
		
		List<MyBasketDto> myBasketList=null;
		if(count > 0){
			myBasketList=iMyBasketDao.myBasketList(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + "myBasketList Size:"+myBasketList);
		}
		
		mav.addObject("myBasketList", myBasketList);
		mav.addObject("count", count);
		mav.addObject("sum",sum);
		}
		mav.setViewName("myBasket/myBasketList");
	}

	/**
	 * @함수이름 : myBasketDelete
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 내역 제거
	 */
	@Override
	public void myBasketDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		int basket_num=Integer.parseInt(request.getParameter("basket_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + "basket_num:"+basket_num);
		
		int value=iMyBasketDao.myBasketDelete(basket_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "value:" + value);
		
		String member_id=request.getParameter("member_id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + "member_id:" + member_id);
		
		List<MyBasketDto> myBasketSelectList=iMyBasketDao.myBasketSelectList(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "myBasketDto:"+myBasketSelectList);
		
		int sum=0;
		
		for(int i=0;i<myBasketSelectList.size();i++){
			sum+=myBasketSelectList.get(i).getBasket_total_price();
		}
		
		GoBookAspect.logger.info(GoBookAspect.logMsg + "sum:"+sum);
		try{
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(sum);
		}catch(IOException e){
			e.printStackTrace();
		}
	}

	/**
	 * @함수이름 : myBasketUpdate
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 황규성
	 * @설명 : 장바구니 수정
	 */
	@Override
	public void myBasketUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		int basket_num=Integer.parseInt(request.getParameter("basket_num"));
		
		int basket_quantity=Integer.parseInt(request.getParameter("value"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + "basket_num:"+basket_num + "," + "value:" + basket_quantity);
		
		/*int basket_book_price=Integer.parseInt(request.getParameter("basket_book_price"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + "basket_book_price:" + basket_book_price);
		
		//int basket_previous_quantity=Integer.parseInt(request.getParameter("basket_previous_quantity"));
		
		int basket_total_price=basket_book_price*basket_quantity;
		GoBookAspect.logger.info(GoBookAspect.logMsg + "basket_quantity:"+basket_quantity +"," + "basket_total_price:"+basket_total_price);*/
		
		MyBasketDto myBasketDto=iMyBasketDao.myBasketSelect(basket_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "myBasketDto:"+myBasketDto);
		
		int basket_book_price=myBasketDto.getBasket_book_price();
		
		int basket_total_price=basket_book_price*basket_quantity;
		GoBookAspect.logger.info(GoBookAspect.logMsg + "basket_book_price:" + basket_book_price + "," +basket_quantity+","+ "basket_total_price:"+basket_total_price);
		
		myBasketDto.setBasket_quantity(basket_quantity);
		myBasketDto.setBasket_total_price(basket_total_price);
		
		int check=iMyBasketDao.myBasketUpdate(myBasketDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "check:" + check);
		
		String member_id=myBasketDto.getMember_id();
		GoBookAspect.logger.info(GoBookAspect.logMsg + "member_id:" + member_id);
		
		List<MyBasketDto> myBasketSelectList=iMyBasketDao.myBasketSelectList(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "myBasketDto:"+myBasketSelectList);
		
		int sum=0;
		
		for(int i=0;i<myBasketSelectList.size();i++){
			sum+=myBasketSelectList.get(i).getBasket_total_price();
		}
		
		GoBookAspect.logger.info(GoBookAspect.logMsg + "sum:"+sum);
		if(check > 0){
			try{
				String str=basket_num + "," + basket_quantity + "," + basket_total_price + "," + sum;
				GoBookAspect.logger.info(GoBookAspect.logMsg + "str:" + str);
				
				response.setContentType("application/html;charset=utf-8");
				PrintWriter out=response.getWriter();
				out.print(str);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}