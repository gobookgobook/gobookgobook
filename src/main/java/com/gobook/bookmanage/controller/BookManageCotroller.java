package com.gobook.bookmanage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dto.BookDto;
import com.gobook.bookmanage.dto.BookGroupPurchaseDto;
import com.gobook.bookmanage.service.IBookManageService;

/**
 * @클래스이름 : BookManageCotroller
 * @날짜 : 2015. 12. 18.
 * @개발자 : 성기훈
 * @설명 : 도서관리 컨트롤러
 */
@Controller
public class BookManageCotroller {
	
	@Autowired
	private IBookManageService iBookManageService;
	
	/**
	 * @함수이름 : bookManager
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 도서관리 메인페이지
	 */
	@RequestMapping(value="/bookManage/bookManage.do", method=RequestMethod.GET)
	public ModelAndView bookManager(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookManager(mav);
		
		return mav;
	}

	/**
	 * @함수이름 : bookInsert
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서등록
	 */
	@RequestMapping(value="/bookManage/bookInsert.do", method=RequestMethod.GET)
	public ModelAndView bookInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookInsert(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookInsertOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서등록
	 */
	@RequestMapping(value="/bookManage/bookInsert.do", method=RequestMethod.POST)
	public ModelAndView bookInsertOk(HttpServletRequest request, HttpServletResponse response, BookDto bookDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		iBookManageService.bookInsertOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookStockList
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서재고현황
	 */
	@RequestMapping(value="/bookManage/bookStockList.do", method=RequestMethod.GET)
	public ModelAndView bookStockList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookStockList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookUpdate
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정
	 */
	@RequestMapping(value="/bookManage/bookUpdate.do", method=RequestMethod.GET)
	public ModelAndView bookUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookUpdateOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정
	 */
	@RequestMapping(value="/bookManage/bookUpdate.do", method=RequestMethod.POST)
	public ModelAndView bookUpdateOk(HttpServletRequest request, HttpServletResponse response, BookDto bookDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		iBookManageService.bookUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookReOrderList
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 현황
	 */
	@RequestMapping(value="/bookManage/bookReOrderList.do", method=RequestMethod.GET)
	public ModelAndView bookReOrderList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookReOrderList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookReOrderCount
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 요청 리스트
	 */
	@RequestMapping(value="/bookManage/bookReOrderCount.do", method=RequestMethod.GET)
	public ModelAndView bookReOrderCount(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookReOrderCount(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookGroupPurchase
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 요청 리스트
	 */
	@RequestMapping(value="/bookManage/bookGroupPurchase.do", method=RequestMethod.GET)
	public ModelAndView bookGroupPurchase(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookGroupPurchase(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookSoldOutList
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 품절 도서 목록
	 */
	@RequestMapping(value="/bookManage/bookSoldOutList.do", method=RequestMethod.GET)
	public ModelAndView bookSoldOutList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookSoldOutList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookGroupPurchaseInsert
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 등록
	 */
	@RequestMapping(value="/bookManage/bookGroupPurchaseInsert.do", method=RequestMethod.GET)
	public ModelAndView bookGroupPurchaseInsert(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookGroupPurchaseInsert(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookGroupPurchaseInsertOk
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 등록
	 */
	@RequestMapping(value="/bookManage/bookGroupPurchaseInsert.do", method=RequestMethod.POST)
	public ModelAndView bookGroupPurchaseInsertOk(HttpServletRequest request, HttpServletResponse response, BookGroupPurchaseDto bookGroupPurchaseDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("bookGroupPurchaseDto", bookGroupPurchaseDto);
		iBookManageService.bookGroupPurchaseInsertOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookGroupPurchaseUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 수정
	 */
	@RequestMapping(value="/bookManage/bookGroupPurchaseUpdate.do", method=RequestMethod.GET)
	public ModelAndView bookGroupPurchaseUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookGroupPurchaseUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookGroupPurchaseUpdateOk
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 수정 
	 */
	@RequestMapping(value="/bookManage/bookGroupPurchaseUpdate.do", method=RequestMethod.POST)
	public ModelAndView bookGroupPurchaseUpdateOk(HttpServletRequest request, HttpServletResponse response, BookGroupPurchaseDto bookGroupPurchaseDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("bookGroupPurchaseDto", bookGroupPurchaseDto);
		iBookManageService.bookGroupPurchaseUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookGroupPurchaseDelete
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공구등록 취소
	 */
	@RequestMapping(value="/bookManage/bookGroupPurchaseDelete.do", method=RequestMethod.GET)
	public ModelAndView bookGroupPurchaseDelete(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookGroupPurchaseDelete(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookSchedule
	 * @작성일 : 2015. 12. 14.
	 * @개발자 : 성기훈
	 * @설명 : 도서 출간 일정
	 */
	@RequestMapping(value="/bookManage/bookSchedule.do", method=RequestMethod.GET)
	public ModelAndView bookSchedule(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookSchedule(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookNewPublishList
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 성기훈
	 * @설명 : 신간 구매 희망 목록
	 */
	@RequestMapping(value="/bookManage/bookNewPublishList.do", method=RequestMethod.GET)
	public ModelAndView bookNewPublishList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookNewPublishList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookList
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서목록
	 */
	@RequestMapping(value="/bookManage/bookList.do", method=RequestMethod.GET)
	public ModelAndView bookList(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookList(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookRead
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서 세부 정보
	 */
	@RequestMapping(value="/bookManage/bookRead.do", method=RequestMethod.GET)
	public ModelAndView bookRead(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("response", response);
		iBookManageService.bookRead(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookStockUpdate
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서 입고
	 */
	@RequestMapping(value="/bookManage/bookStockUpdate.do", method=RequestMethod.GET)
	public ModelAndView bookStockUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookStockUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookStockUpdateOk
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서 입고
	 */
	@RequestMapping(value="/bookManage/bookStockUpdate.do", method=RequestMethod.POST)
	public ModelAndView bookStockUpdateOk(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookStockUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookSpecialPriceUpdate
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서 특가 설정
	 */
	@RequestMapping(value="/bookManage/bookSpecialPriceUpdate.do", method=RequestMethod.GET)
	public ModelAndView bookSpecialPriceUpdate(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookSpecialPriceUpdate(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookSpecialPriceUpdateOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서특가 설정
	 */
	@RequestMapping(value="/bookManage/bookSpecialPriceUpdate.do", method=RequestMethod.POST)
	public ModelAndView bookSpecialPriceUpdateOk(HttpServletRequest request, HttpServletResponse response, BookDto bookDto){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		mav.addObject("bookDto", bookDto);
		iBookManageService.bookSpecialPriceUpdateOk(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookSpecialPriceCancle
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 특가 설정 취소
	 */
	@RequestMapping(value="/bookManage/bookSpecialPriceCancle.do", method=RequestMethod.GET)
	public ModelAndView bookSpecialPriceCancle(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookSpecialPriceCancle(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookSpecialPrice
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서 특가 목록
	 */
	@RequestMapping(value="/bookManage/bookSpecialPrice.do", method=RequestMethod.GET)
	public ModelAndView bookSpecialPrice(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookSpecialPrice(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : bookGroupPurchaseSuccess
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 공구조건충족 공구진행 목록
	 */
	@RequestMapping(value="/bookManage/bookGroupPurchaseSuccess.do", method=RequestMethod.GET)
	public ModelAndView bookGroupPurchaseSuccess(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.bookGroupPurchaseSuccess(mav);
		
		return mav;
	}
	
	/**
	 * @함수이름 : gpSuccessConfirm
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 승인후 사용자 장바구니 담기
	 */
	@RequestMapping(value="/bookManage/gpSuccessConfirm.do", method=RequestMethod.GET)
	public ModelAndView gpSuccessConfirm(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mav=new ModelAndView();
		mav.addObject("request", request);
		iBookManageService.gpSuccessConfirm(mav);
		
		return mav;
	}
}
