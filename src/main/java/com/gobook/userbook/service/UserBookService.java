package com.gobook.userbook.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tools.ant.taskdefs.Replace;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dto.BookDto;
import com.gobook.bookmanage.dto.BookGroupPurchaseDto;
import com.gobook.member.dao.IMemberDao;
import com.gobook.mybasket.dto.MyBasketDto;
import com.gobook.userbook.dao.IUserBookDao;
import com.gobook.userbook.dto.UserBookStarDto;
import com.gobook.userorder.dto.UserOrderDto;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Component
public class UserBookService implements IUserBookService {

	@Autowired
	private IUserBookDao iUserBookDao;
	@Autowired
	private IMemberDao iMemberDao;

	/**
	 * @함수이름 : userBookRead
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 도서 상세 보기
	 */
	@Override
	public void userBookRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
//		long book_num=1;
		long book_num=Long.parseLong(request.getParameter("book_num"));//나중에 주석지움
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_num);
		
		BookDto bookDto=iUserBookDao.userBookRead(book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + bookDto);
/*		
		if(bookDto.getBook_index() !=null){
			bookDto.setBook_index(bookDto.getBook_index().replace("\r\n", "<br/>"));
		}
		if(bookDto.getBook_summary() !=null){
			bookDto.setBook_summary(bookDto.getBook_summary().replace("\r\n", "<br/>"));
		}
		*/
		String book_name=null;
		if(bookDto.getBook_cover_file_name() !=null){
			book_name=bookDto.getBook_cover_file_name();
		}
		 
		//최근본 도서
		try {
			if(book_name==null){
				book_name="a.jpg";
			}
			response.setContentType("text/html;charset=euc-kr");
			request.setCharacterEncoding("euc-kr");
			Cookie cookie=new Cookie(String.valueOf(book_num), URLEncoder.encode(book_name, "utf-8"));
			cookie.setMaxAge(60*60*20);
			cookie.setPath("/");
			response.addCookie(cookie);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
		mav.addObject("bookDto", bookDto);
		mav.setViewName("userBook/userBookRead");
		
	}

	/**
	 * @함수이름 : userBookBasketInsert
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 장바구니 담기
	 */
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
		
		HashMap<String, Object> starMap=new HashMap<String, Object>();
		starMap.put("book_num", book_num);
		starMap.put("member_id", member_id);
		
		MyBasketDto myBasketDto=iUserBookDao.myBasketSelect(starMap);
		GoBookAspect.logger.info(GoBookAspect.logMsg + myBasketDto);
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("member_id", member_id);					//id
		hMap.put("book_num", book_num);						//도서번호
		hMap.put("book_quantity", book_quantity);			//도서수량
		hMap.put("basket_total_price", basket_total_price);	//도서 총가격
		
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

	/**
	 * @함수이름 : userBookSoldOutAsk
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 품절시 재입고 요청
	 */
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

	/**
	 * @함수이름 : userBookGroupPurchaseAsk
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 희망 공동구매 요청
	 */
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

	/**
	 * @함수이름 : userBookStarInsert
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 별점 추가
	 */
	@Override
	public void userBookStarInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");

		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		int userbookstar_star=Integer.parseInt(request.getParameter("userbookstar_star"));
		long book_num=Long.parseLong(request.getParameter("book_num"));
		
		HashMap<String, Object> userStarMap=new HashMap<String, Object>();
		userStarMap.put("book_num", book_num);
		userStarMap.put("member_id", member_id);
		int starDto=iUserBookDao.starSelect(userStarMap);
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

	/**
	 * @함수이름 : userBookList
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 도서 목록
	 */
	@Override
	public void userBookList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String category=request.getParameter("category");
		GoBookAspect.logger.info(GoBookAspect.logMsg + category);
		
		int bookDtoCount=iUserBookDao.userBookListCount(category);
		GoBookAspect.logger.info(GoBookAspect.logMsg + bookDtoCount);
		
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int boardSize=9;
		
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("startRow", startRow);
		hMap.put("endRow", endRow);
		hMap.put("category", category);
		
		List<BookDto> bookDto=null;
		if(bookDtoCount > 0){
			bookDto=iUserBookDao.userBookListSelect(hMap);
			GoBookAspect.logger.info(GoBookAspect.logMsg + bookDto.size());
		}
		
		mav.addObject("bookDto", bookDto);
		mav.addObject("bookDtoCount", bookDtoCount);
		mav.addObject("boardSize", boardSize);
		mav.addObject("category", category);
		mav.addObject("currentPage", currentPage);
		mav.setViewName("userBook/userBookList");
		
	}

	/**
	 * @함수이름 : userBookSerch
	 * @작성일 : 2015. 12. 15.
	 * @개발자 : 성기훈
	 * @설명 : 도서검색
	 */
	@Override
	public void userBookSerch(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String keyword=request.getParameter("keyword");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iUserBookDao.bookSerchCount(keyword);
		
		List<BookDto> bookSerchList=null;
		if(count>0){
			HashMap<String, Object> hMap=new HashMap<String, Object>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			hMap.put("keyword", keyword);
			bookSerchList=iUserBookDao.bookSerchList(hMap);
		}
		
		mav.addObject("bookSerchList", bookSerchList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("keyword", keyword);
		
		mav.setViewName("userBook/userBookSerch");
	}

	/**
	 * @함수이름 : userBookInterestReading
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 관심도서 추천
	 */
	@Override
	public void userBookInterestReading(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);

		List<BookDto> book=new ArrayList<BookDto>();
		List<BookDto> bestList=null;

		if(member_id !=null){
			
			String interest=null;
			String member_interest=iUserBookDao.interestSelect(member_id);
			GoBookAspect.logger.info(GoBookAspect.logMsg + member_interest);
		
			List<BookDto> interestBook=null;
				
			if(member_interest != null){
				System.out.println("ok1");
				
				StringTokenizer stok2=new StringTokenizer(member_interest, ",");
				
				while(stok2.hasMoreTokens()){
					
					interest=stok2.nextToken();
					GoBookAspect.logger.info(GoBookAspect.logMsg + interest);
					
					interestBook=iUserBookDao.userBookInterestReadingSelect(interest);
					book.addAll(interestBook);
					GoBookAspect.logger.info(GoBookAspect.logMsg + interestBook.size());
					
					}
				
				GoBookAspect.logger.info(GoBookAspect.logMsg + book.size());
				GoBookAspect.logger.info(GoBookAspect.logMsg + book);
			}else if(member_interest == null){
				System.out.println("ok2");
				bestList=iMemberDao.userBookBestSeller();
				GoBookAspect.logger.info(GoBookAspect.logMsg + bestList.size());
			}
			
		}
		mav.addObject("bestList", bestList);
		mav.addObject("book", book);
		mav.addObject("member_id", member_id);
		mav.setViewName("userBook/userBookInterestRead");
	}

	/**
	 * @함수이름 : suggest
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 성기훈
	 * @설명 : 도서검색 suggest
	 */
	@Override
	public void suggest(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		String value = request.getParameter("value");
		JSONArray sujestList = new JSONArray();
	    JSONObject obj = null;
	    List<String> sujestBookList=iUserBookDao.sujestBookList(value);
	    
	    for(int i=0; i<sujestBookList.size(); i++) {
	    	obj=new JSONObject();
	    	obj.put("data", sujestBookList.get(i));
	    	sujestList.add(obj);
	    }
	    
	    PrintWriter pw=null;
	    response.setContentType("application/html;charset=utf-8");
		try {
			pw = response.getWriter();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    pw.print(sujestList);
	    pw.flush();
	    pw.close();
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseList
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 진행중인 공동구매 목록
	 */
	@Override
	public void userBookGroupPurchaseList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		List<BookGroupPurchaseDto> groupList=iUserBookDao.userBookGroupPurchaseList();
		GoBookAspect.logger.info(GoBookAspect.logMsg + groupList.size());
		
		mav.addObject("groupList", groupList);
		mav.setViewName("userBook/userBookGroupPurchaseList");
		
	}
	
	/**
	 * @함수이름 : userBookGroupPurchaseRead
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 오주석
	 * @설명 : 진행중인 공동구매 상세확인
	 */
	@Override
	public void userBookGroupPurchaseRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
			
		long book_num=Long.parseLong(request.getParameter("book_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_num);
		
		BookGroupPurchaseDto bookGroupPurchaseDto=iUserBookDao.userBookGroupPurchaseRead(book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + bookGroupPurchaseDto);
		
		mav.addObject("bookGroupPurchaseDto", bookGroupPurchaseDto);
		mav.setViewName("userBook/userBookGroupPurchaseRead");
	}

	/**
	 * @함수이름 : userBookGroupPurchaseInsert
	 * @작성일 : 2015. 12. 17.
	 * @개발자 : 오주석
	 * @설명 : 진행중인 공동구매 신청
	 */
	@Override
	public void userBookGroupPurchaseInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		HttpSession session=request.getSession();
		String member_id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + member_id);
		
		if(member_id !=null){
			long book_num=Long.parseLong(request.getParameter("book_num"));
			int group_purchase_num=Integer.parseInt(request.getParameter("gp_num"));
			GoBookAspect.logger.info(GoBookAspect.logMsg + book_num+","+group_purchase_num);
			
			HashMap<String, Object> userMap=new HashMap<String, Object>();
			userMap.put("book_num", book_num);
			userMap.put("member_id", member_id);
			
			int count=iUserBookDao.userBookGroupPurchaseSelect(userMap);
			GoBookAspect.logger.info(GoBookAspect.logMsg + count);
			
			HashMap<String, Object> hMap=new HashMap<String, Object>();
			hMap.put("book_num", book_num);
			hMap.put("group_purchase_num", group_purchase_num);
			hMap.put("member_id", member_id);			
				
			int check = 0;
			int value = 0;
			if(count ==0){
				value=iUserBookDao.userBookGroupPurchaseInsert(hMap);
				GoBookAspect.logger.info(GoBookAspect.logMsg + value);
			
				if(value >0){
					check=iUserBookDao.userBookGroupPurchaseUpdate(group_purchase_num);
					GoBookAspect.logger.info(GoBookAspect.logMsg + check);
				}
			}
			
			String str=value + "," + count;
			try {
				response.setContentType("application/html;charset=utf-8");
				PrintWriter out=response.getWriter();
				out.print(str);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}	
	}
	
	/**
	 * @함수이름 : euckr_encode
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 오주석
	 * @설명 : 최근본 도서 인코더
	 */
	public static String euckr_encode(String str){
		String rslt = "";
		if(str!=null){
			try{
				rslt = URLEncoder.encode(str,"utf-8");
			}catch(Exception e){ 
				//return "";
			}
		}
		return rslt;
	}
	
	/**
	 * @함수이름 : euckr_decode
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 오주석
	 * @설명 : 최근본 도서 디코더
	 */
	public static String euckr_decode(String str){
		String rslt = "";
		if(str!=null){
			try{
				rslt = URLDecoder.decode(str,"utf-8");
			}catch(Exception e){
				//return "";
			}
		}
		return rslt;
	}

	@Override
	public void userBookPreview(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + book_num);
		
		BookDto preview=iUserBookDao.userBookPreview(book_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + preview);
		
		mav.addObject("preview", preview);
		mav.setViewName("userBook/preview");
	}
}

