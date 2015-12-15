package com.gobook.userbook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dto.BookDto;
import com.gobook.mybasket.dto.MyBasketDto;
import com.gobook.userbook.dao.IUserBookDao;
import com.gobook.userbook.dto.UserBookStarDto;
import com.gobook.userorder.dto.UserOrderDto;

@Component
public class UserBookService implements IUserBookService {

	@Autowired
	private IUserBookDao iUserBookDao;

	@Override
	public void userBookRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
//		long book_num=1;
		long book_num=Long.parseLong(request.getParameter("book_num"));
		
		BookDto bookDto=iUserBookDao.userBookRead(book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + bookDto);
		
		HashMap<String, Object> orderMap=new HashMap<String, Object>();
		orderMap.put("book_num", book_num);
		orderMap.put("member_id", member_id);
		
		int order_bunho=iUserBookDao.userOrderSelect(orderMap);
		GoBookAspect.logger.info(GoBookAspect.logMsg + order_bunho);
		
		mav.addObject("bookDto", bookDto);
		mav.addObject("order_bunho", order_bunho);
		mav.setViewName("userBook/userBookRead");
		
	}

	@Override
	public void userBookBasketInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		int book_price=Integer.parseInt(request.getParameter("book_price"));
		int book_quantity=Integer.parseInt(request.getParameter("book_quantity"));
		int basket_total_price=book_price*book_quantity;
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_price);
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_quantity);
		GoBookAspect.logger.info(GoBookAspect.logMsg + basket_total_price);
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("member_id", member_id);					//id
		hMap.put("book_num", book_num);						//도서번호
		hMap.put("book_quantity", book_quantity);			//도서수량
		hMap.put("basket_total_price", basket_total_price);	//도서 총가격
		
		MyBasketDto myBasketDto=iUserBookDao.myBasketSelect(book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + myBasketDto);
		
		int value=0;
		if(myBasketDto == null){
			value=iUserBookDao.userBookBasketInsert(hMap);
			GoBookAspect.logger.info(GoBookAspect.logMsg + value);
		}
		
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(value);
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	@Override
	public void userBookSoldOutAsk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_num);
		
		int value=0;
		value=iUserBookDao.userBookSoldOutAskUpdate(book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + value);
		
		
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(value);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void userBookGroupPurchaseAsk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_num);
		
			
		int value=0;
		value=iUserBookDao.userBookGroupPurchaseAskUpdate(book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + value);
		
		
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(value);
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void userBookStarInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");

		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		int userbookstar_star=Integer.parseInt(request.getParameter("userbookstar_star"));
		int book_num=Integer.parseInt(request.getParameter("book_num"));
		

		int starDto=iUserBookDao.starSelect(member_id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "starDto:" +starDto);
		
		float avgStar=0;
		if(starDto == 0){				//평점을 준적이 없으면 실행
			
			HashMap<String, Object> hMap=new HashMap<String, Object>();
			hMap.put("userbookstar_star", userbookstar_star);
			hMap.put("book_num", book_num);
			hMap.put("member_id", member_id);
			
			int value=iUserBookDao.userBookStarInsert(hMap);				//userBookStar 에 평점 집어넣음
			GoBookAspect.logger.info(GoBookAspect.logMsg + value);
			
			int star=iUserBookDao.userbookstarSelect(book_num);				//userBookStar에서 책 하나(book_num 기준)에 대한 평점의 총점
			GoBookAspect.logger.info(GoBookAspect.logMsg + star);
			
			int count=iUserBookDao.userbookstarCount(book_num);				//userBookStar에서 책 하나(book_num 기준)에 대한 평점을 준 유저 숫자
			GoBookAspect.logger.info(GoBookAspect.logMsg + count);
			
			avgStar=(float)star/count;								//평점 평균 구하기
	
			HashMap<String, Object> starMap=new HashMap<String, Object>();
			starMap.put("book_num", book_num);
			starMap.put("avgStar", avgStar);
			
			int check=iUserBookDao.bookStarUpdate(starMap);					//book에있는 평점 업데이트
			GoBookAspect.logger.info(GoBookAspect.logMsg + check);
		
		}
		
		String str=avgStar + "," + starDto;
		try {
			response.setContentType("application/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
