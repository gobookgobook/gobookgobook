package com.gobook.userorder.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	 * @날짜 : 2015. 12. 16.
	 * @개발자 : 황규성
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
	
	@Override
	public void userOrder(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession idSession=request.getSession();
		String member_id=(String) idSession.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		long book_num=Long.parseLong(request.getParameter("book_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_num);
		int book_quantity=Integer.parseInt(request.getParameter("book_quantity"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_quantity);
		int book_price=Integer.parseInt(request.getParameter("book_price"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_price);
		String book_name=request.getParameter("book_name");
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_name);
		
		
		if(member_id !=null){
			HttpSession basketSession=request.getSession();
			
			basketSession.setAttribute("purchase", "immediately");
			basketSession.setMaxInactiveInterval(60*60);	// 세션 시간:1시간
			
			String purchase=(String) basketSession.getAttribute("purchase");
			GoBookAspect.logger.info(GoBookAspect.logMsg + purchase);
			
			MemberDto memberDto=iMemberDao.memberSelect(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + memberDto);
			
			int sum=book_price*book_quantity;
			
			mav.addObject("memberDto", memberDto);
			mav.addObject("book_num", book_num);
			mav.addObject("book_quantity", book_quantity);
			mav.addObject("book_price", book_price);
			mav.addObject("book_name", book_name);
			mav.addObject("sum", sum);
		}
		
		mav.setViewName("userOrder/userOrderList");
	}

	/**
	 * @함수이름 : userOrderCouponList
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 쿠폰 리스트
	 */
	@Override
	public void userOrderCouponList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession idSession=request.getSession();
		String member_id=(String) idSession.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + "member_id:"+member_id);
		
		if(member_id !=null){
			List<UserCouponDto> userOrderCouponList=iUserOrderDao.userOrderCouponListSelect(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg+"userOrderCouponList Size:"+userOrderCouponList.size());
			mav.addObject("userOrderCouponList", userOrderCouponList);
		}
		
		mav.setViewName("userOrder/userOrderCouponList");
	}
	
	/**
	 * @클래스이름 : UserOrderPay
	 * @날짜 : 2015. 12. 17.
	 * @개발자 : 황규성
	 * @설명 : 주문 결제(장바구니)
	 */
	@Override
	public void userOrderPay(ModelAndView mav) {
		Map<String,Object> map= mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession idSession=request.getSession();
		String member_id=(String) idSession.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		String purchase=(String) idSession.getAttribute("purchase");
		int check=0;
		
		if(member_id !=null){
			UserOrderDto userOrderDto=(UserOrderDto) map.get("userOrderDto");
			
			userOrderDto.setMember_id(member_id);
			userOrderDto.setOrder_book_user_number(request.getParameter("order_book_user_number"));
			userOrderDto.setOrder_book_state(1);
			String coupon_discount=request.getParameter("coupon_discount");		// 쿠폰을 선택하지 않은 상태로 주문 시, null이 넘어오기 때문에 이를 처리하기 위한 코드
			if(coupon_discount=="") coupon_discount="0";		
			int order_user_coupon_discount=Integer.parseInt(coupon_discount);
			
			userOrderDto.setOrder_user_coupon_discount(order_user_coupon_discount);
			
			GoBookAspect.logger.info(GoBookAspect.logMsg + "order_user_coupon_discount:"+order_user_coupon_discount);
			
			if(purchase=="basket"){
				List<MyBasketDto> myBasketList=iMyBasketDao.myBasketList(member_id);
				GoBookAspect.logger.info(GoBookAspect.logMsg+"myBasketList Size:"+myBasketList.size());
				
				for(int i=0;i<myBasketList.size();i++){
					// i==0 point 여기서만 계산 나머지는 point 계산 x 로 처리해야 됨(2015-12-17 21:01)
					userOrderDto.setBook_num(myBasketList.get(i).getBook_num());
					userOrderDto.setOrder_book_name(myBasketList.get(i).getBasket_book_name());
					userOrderDto.setOrder_book_price(myBasketList.get(i).getBasket_book_price());
					userOrderDto.setOrder_book_count(myBasketList.get(i).getBasket_quantity());
					if(i==0){
						// 총결제액
						// i==0 point 여기서만 계산 나머지는 point 계산 x 로 처리해야 됨(2015-12-17 21:01)
						// i==0 %쿠폰이 아니면 여기서 처리해야함
						if(userOrderDto.getOrder_user_coupon_discount()>=100){				//coupon이 원 쿠폰일때 계산
							userOrderDto.setOrder_total_price( myBasketList.get(i).getBasket_total_price()-(int)(userOrderDto.getOrder_book_point()+ userOrderDto.getOrder_user_coupon_discount()));
						}else{																//coupon이 퍼센트 쿠폰일때 계산
							userOrderDto.setOrder_total_price( myBasketList.get(i).getBasket_total_price()-(int)(userOrderDto.getOrder_book_point()+ (myBasketList.get(i).getBasket_total_price()*userOrderDto.getOrder_user_coupon_discount()*0.01)));
						}
					}else{
						if(userOrderDto.getOrder_user_coupon_discount()>=100){				//coupon이 원 쿠폰일때 계산
							userOrderDto.setOrder_total_price( myBasketList.get(i).getBasket_total_price()-(int)(userOrderDto.getOrder_user_coupon_discount()));
						}else{																//coupon이 퍼센트 쿠폰일때 계산
							userOrderDto.setOrder_total_price( myBasketList.get(i).getBasket_total_price()-(int)((myBasketList.get(i).getBasket_total_price()*userOrderDto.getOrder_user_coupon_discount()*0.01)));
						}
					}
					GoBookAspect.logger.info(GoBookAspect.logMsg + "userOrderDto:" + userOrderDto);	//주문 dto에 정보 전부 입력
					check=iUserOrderDao.userOrderPayInsert(userOrderDto);
					GoBookAspect.logger.info(GoBookAspect.logMsg + "1.insert:" +check);// 1. insert 성공시 check
		
					// 2.일일매출에 insert
					//1) select -> 도서번호에 해당하는 도서 원가
					int book_cost=iUserOrderDao.userOrderSalesBookSelect(userOrderDto.getBook_num());
					GoBookAspect.logger.info(GoBookAspect.logMsg + "book_cost:" + book_cost);	
					//2) 계산 : 결제액 - 수량*도서원가
					int salesDaily_profit=userOrderDto.getOrder_total_price() - (book_cost*userOrderDto.getOrder_book_count());
					GoBookAspect.logger.info(GoBookAspect.logMsg + "salesDaily_profit:" + salesDaily_profit);
					//3) 주문insert로 수행된 order_num select로 가져오기
					UserOrderDto salesUOD=iUserOrderDao.salesUODSelect();
					GoBookAspect.logger.info(GoBookAspect.logMsg + "salesUOD:" + salesUOD);
					//4) INSERT 일일매출 
					int salesInsertCheck=iUserOrderDao.userOrderSalesInsert(salesUOD, salesDaily_profit);
					GoBookAspect.logger.info(GoBookAspect.logMsg + "2.salesInsertCheck:" + salesInsertCheck);
					
					// 3. 주문시 책에서 도서 수량 감소
					int upBookCountCheck = iUserOrderDao.userOrderUpBookCount(userOrderDto.getBook_num(),userOrderDto.getOrder_book_count());
					GoBookAspect.logger.info(GoBookAspect.logMsg + "3.upBookCountCheck : " + upBookCountCheck);
				}
				
				// 4. 장바구니 내역 제거 check
				int delCheck=iUserOrderDao.userOrderBasketDelete(member_id);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "4.delete:" +delCheck);// 5. delete 성공시 check
				
			}else{
				//개별주문 들어오면 처리할 INSERT 부분
				GoBookAspect.logger.info(GoBookAspect.logMsg + "userOrderDto:" + userOrderDto);	//주문 dto에 정보 전부 입력
				// 2.일일매출에 insert
				int total= userOrderDto.getOrder_book_price()*userOrderDto.getOrder_book_count();
				if(userOrderDto.getOrder_user_coupon_discount()>=100){				//coupon이 원 쿠폰일때 계산
					userOrderDto.setOrder_total_price( total-(int)(userOrderDto.getOrder_book_point()+ userOrderDto.getOrder_user_coupon_discount()));
				}else{																//coupon이 퍼센트 쿠폰일때 계산
					userOrderDto.setOrder_total_price( total-(int)(userOrderDto.getOrder_book_point()+ (total*userOrderDto.getOrder_user_coupon_discount()*0.01)));
				}
				
				GoBookAspect.logger.info(GoBookAspect.logMsg + "userOrderDto:" + userOrderDto);	//주문 dto에 정보 전부 입력
				check=iUserOrderDao.userOrderPayInsert(userOrderDto);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "1.insert:" +check);// 1. insert 성공시 check
	
				// 2.일일매출에 insert
				//1) select -> 도서번호에 해당하는 도서 원가
				int book_cost=iUserOrderDao.userOrderSalesBookSelect(userOrderDto.getBook_num());
				GoBookAspect.logger.info(GoBookAspect.logMsg + "book_cost:" + book_cost);	
				//2) 계산 : 결제액 - 수량*도서원가
				int salesDaily_profit=userOrderDto.getOrder_total_price() - (book_cost*userOrderDto.getOrder_book_count());
				GoBookAspect.logger.info(GoBookAspect.logMsg + "salesDaily_profit:" + salesDaily_profit);
				//3) 주문insert로 수행된 order_num select로 가져오기
				UserOrderDto salesUOD=iUserOrderDao.salesUODSelect();
				GoBookAspect.logger.info(GoBookAspect.logMsg + "salesUOD:" + salesUOD);
				//4) INSERT 일일매출 
				int salesInsertCheck=iUserOrderDao.userOrderSalesInsert(salesUOD, salesDaily_profit);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "2.salesInsertCheck:" + salesInsertCheck);
				
				// 3. 주문시 책에서 도서 수량 감소
				int upBookCountCheck = iUserOrderDao.userOrderUpBookCount(userOrderDto.getBook_num(),userOrderDto.getOrder_book_count());
				GoBookAspect.logger.info(GoBookAspect.logMsg + "3.upBookCountCheck : " + upBookCountCheck);
			}
			
			
			// 5. 사용한 쿠폰이 있으면(쿠폰명이 null이 아닐 시), 쿠폰 제거 check
			String temp=request.getParameter("order_user_coupon_num");
			if(!(temp.equals(null)) && !(temp.equals(""))){
				int order_user_coupon_num=Integer.parseInt(request.getParameter("order_user_coupon_num"));
				GoBookAspect.logger.info(GoBookAspect.logMsg + "order_user_coupon_num:" +order_user_coupon_num);
				int delCouponCheck=iUserOrderDao.userOrderCouponDelete(member_id, order_user_coupon_num);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "5.delCouponCheck:" +delCouponCheck);// 3. 쿠폰 delete 성공시 check
			}
			
			
			// 6. 사용한 포인트가 있으면(사용한 포인트가 0이 아닐 시), 포인트 감소 업데이트 check
			int order_book_point=userOrderDto.getOrder_book_point();
			if(order_book_point!=0){
				int upPointCheck=iUserOrderDao.userOrderPointUpdate(member_id, order_book_point);
				GoBookAspect.logger.info(GoBookAspect.logMsg + "6.upPointCheck:" +upPointCheck);// 4. 포인트 update 성공시 check
			}
			
			// 7. 주문시 포인트 적립액에 따른 사용자 포인트 증가
			
			float allBookPoint = Float.parseFloat(request.getParameter("allBookPoint"));
			int savingPoint = (int)allBookPoint;
			GoBookAspect.logger.info(GoBookAspect.logMsg + "7.allBookPoint:" +savingPoint);
			
			int savingPointCheck = iUserOrderDao.userOrderSavingPoint(member_id,savingPoint);
			GoBookAspect.logger.info(GoBookAspect.logMsg + "7.savingPointCheck:" +savingPointCheck);
		}
		
		mav.addObject("check",check);
		mav.setViewName("userOrder/userOrderPay");
	}
}
