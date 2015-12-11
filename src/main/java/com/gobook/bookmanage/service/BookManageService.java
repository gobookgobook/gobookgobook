package com.gobook.bookmanage.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dao.IBookManageDao;
import com.gobook.bookmanage.dto.*;

/**
 * @클래스이름 : BookManageService
 * @날짜 : 2015. 12. 8.
 * @개발자 : 성기훈
 * @설명 : 도서 등록 관리 수정 삭제
 */
@Component
public class BookManageService implements IBookManageService {

	@Autowired
	private IBookManageDao iBookManageDao;
	
	/**
	 * @함수이름 : bookManager
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 성기훈
	 * @설명 : 도서관리 홈
	 */
	@Override
	public void bookManager(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.setViewName("bookManage/bookManage");
	}
	
	/**
	 * @함수이름 : bookInsert
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서등록
	 */
	@Override
	public void bookInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.setViewName("bookManage/bookInsert");
	}
	
	/**
	 * @함수이름 : bookInsertOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서등록
	 */
	@Override
	public void bookInsertOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		BookDto bookDto=(BookDto)map.get("bookDto");
		
		if(bookDto.getBook_quantity()!=0) bookDto.setBook_state(1);
		else bookDto.setBook_state(2);
		
		MultipartFile book_cover_file=request.getFile("book_cover_file");
		String book_cover_file_name=book_cover_file.getOriginalFilename();
		long book_cover_file_size=book_cover_file.getSize();
		
		if(book_cover_file_size!=0){
			MultipartFile book_preview_file1=request.getFile("book_preview_file1");
			MultipartFile book_preview_file2=request.getFile("book_preview_file2");
			MultipartFile book_preview_file3=request.getFile("book_preview_file3");
			
			String book_preview_file_name1=book_preview_file1.getOriginalFilename();
			String book_preview_file_name2=book_preview_file2.getOriginalFilename();
			String book_preview_file_name3=book_preview_file3.getOriginalFilename();
			
			long book_preview_file_size1=book_preview_file1.getSize();
			long book_preview_file_size2=book_preview_file2.getSize();
			long book_preview_file_size3=book_preview_file3.getSize();
			
			File path=new File("C:/gobook/bookimg/");
			path.mkdirs();
			
			if(path.exists() && path.isDirectory()){
				File cover_file=new File(path, book_cover_file_name);
				try{
					book_cover_file.transferTo(cover_file);
					
					bookDto.setBook_cover_file_name(book_cover_file_name);
					bookDto.setBook_cover_file_path(cover_file.getAbsolutePath());
					bookDto.setBook_cover_file_size(book_cover_file_size);
					
					if(book_preview_file_size1!=0){
						File preview_file1=new File(path, book_preview_file_name1);
						File preview_file2=new File(path, book_preview_file_name2);
						File preview_file3=new File(path, book_preview_file_name3);
						try{
							book_preview_file1.transferTo(preview_file1);
							book_preview_file2.transferTo(preview_file2);
							book_preview_file3.transferTo(preview_file3);
							
							bookDto.setBook_preview_file_name1(book_preview_file_name1);
							bookDto.setBook_preview_file_name2(book_preview_file_name2);
							bookDto.setBook_preview_file_name3(book_preview_file_name3);
							
							bookDto.setBook_preview_file_path1(preview_file1.getAbsolutePath());
							bookDto.setBook_preview_file_path2(preview_file2.getAbsolutePath());
							bookDto.setBook_preview_file_path3(preview_file3.getAbsolutePath());
							
							bookDto.setBook_preview_file_size1(book_preview_file_size1);
							bookDto.setBook_preview_file_size2(book_preview_file_size2);
							bookDto.setBook_preview_file_size3(book_preview_file_size3);
						}catch(Exception e){
							e.printStackTrace();
						}
					}
				}catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		
		int check=iBookManageDao.bookInsert(bookDto);

		mav.addObject("check", check);
		
		mav.setViewName("bookManage/bookInsertOk");
		
	}


	/**
	 * @함수이름 : bookStockList
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서 현황
	 */
	@Override
	public void bookStockList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookStockCount();
		
		List<BookDto> bookList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookList=iBookManageDao.bookList(hMap);
		}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookList", bookList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookStockList");
		
	}


	/**
	 * @함수이름 : bookStockUpdate
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정(입고요청)
	 */
	@Override
	public void bookStockUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("bookDto", bookDto);
		
		mav.setViewName("bookManage/bookStockUpdate");
	}


	/**
	 * @함수이름 : bookStockUpdateOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정(입고요청)
	 */
	@Override
	public void bookStockUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		BookDto bookDto=(BookDto)map.get("bookDto");
		
		String pageNumber=request.getParameter("pageNumber");
		int reorder_quantity=Integer.parseInt(request.getParameter("reorder_quantity"));
		
		bookDto.setBook_quantity(bookDto.getBook_quantity()+reorder_quantity);
		
		if(bookDto.getBook_quantity()!=0){
			bookDto.setBook_state(1);
			bookDto.setBook_reorder_count(0);
		}
		
		int check=iBookManageDao.bookStockUpdate(bookDto, reorder_quantity);
		
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("check", check);
		
		mav.setViewName("bookManage/bookStockUpdateOk");
	}

	/**
	 * @함수이름 : bookReOrderList
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 현황
	 */
	@Override
	public void bookReOrderList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookReOrderListCount();
		
		List<BookReOrderDto> bookReorderList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookReorderList=iBookManageDao.bookReOrderList(hMap);
		}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookReorderList", bookReorderList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookReOrderList");
		
	}

	/**
	 * @함수이름 : bookReOrderCount
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 요청 리스트
	 */
	@Override
	public void bookReOrderCount(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookReOrderCount();
		
		List<BookDto> bookReOrderCountList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookReOrderCountList=iBookManageDao.bookReOrderCountList(hMap);
		}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookReOrderCountList", bookReOrderCountList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookReOrderCountList");
		
	}

	/**
	 * @함수이름 : bookGroupPurchaseCount
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 요청 리스트
	 */
	@Override
	public void bookGroupPurchase(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookGroupPurchaseCount();
		
		List<BookDto> bookGroupPurchaseCountList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookGroupPurchaseCountList=iBookManageDao.bookGroupPurchaseCountList(hMap);
		}
		
		int gpCount=iBookManageDao.gpCount();
		
		List<BookGroupPurchaseDto> gpList=null;
		if(count>0) gpList=iBookManageDao.gpList();
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookGroupPurchaseCountList", bookGroupPurchaseCountList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		mav.addObject("gpCount", gpCount);
		mav.addObject("gpList", gpList);
		
		mav.setViewName("bookManage/bookGroupPurchase");
		
	}

	/**
	 * @함수이름 : bookSoldOutList
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 성기훈
	 * @설명 : 품절 도서 목록
	 */
	@Override
	public void bookSoldOutList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookSoldOutCount();
		
		List<BookDto> bookSoldOutList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookSoldOutList=iBookManageDao.bookSoldOutList(hMap);
		}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookSoldOutList", bookSoldOutList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookSoldOutList");
		
	}

	/**
	 * @함수이름 : bookGroupPurchaseInsert
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 등록
	 */
	@Override
	public void bookGroupPurchaseInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookDto", bookDto);
		
		mav.setViewName("bookManage/bookGroupPurchaseInsert");
		
	}

	/**
	 * @함수이름 : bookGroupPurchaseInsertOk
	 * @작성일 : 2015. 12. 10.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 등록
	 */
	@Override
	public void bookGroupPurchaseInsertOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		BookGroupPurchaseDto bookGroupPurchaseDto=(BookGroupPurchaseDto)map.get("bookGroupPurchaseDto");
		
		int check=iBookManageDao.bookGroupPurchaseInsert(bookGroupPurchaseDto);
		
		mav.addObject("check", check);
		
		mav.setViewName("bookManage/bookGroupPurchaseInsertOk");
	}

	/**
	 * @함수이름 : bookGroupPurchaseUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 수정
	 */
	@Override
	public void bookGroupPurchaseUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		BookGroupPurchaseDto gpDto=iBookManageDao.gpRead(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("gpDto", gpDto);
		
		mav.setViewName("bookManage/bookGroupPurchaseUpdate");
	}

	/**
	 * @함수이름 : bookGroupPurchaseUpdateOk
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 수정
	 */
	@Override
	public void bookGroupPurchaseUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		BookGroupPurchaseDto bookGroupPurchaseDto=(BookGroupPurchaseDto)map.get("bookGroupPurchaseDto");
		
		int check=iBookManageDao.bookGroupPurchaseUpdate(bookGroupPurchaseDto);
		
		mav.addObject("check", check);
		
		mav.setViewName("bookManage/bookGroupPurchaseUpdateOk");
	}

	/**
	 * @함수이름 : bookGroupPurchaseDelete
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공구등록 취소
	 */
	@Override
	public void bookGroupPurchaseDelete(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int gp_num=Integer.parseInt(request.getParameter("gp_num"));
		
		int check=iBookManageDao.bookGroupPurchaseDelete(gp_num);
		
		mav.addObject("check", check);
		
		mav.setViewName("bookManage/bookGroupPurchaseDelete");
	}
	
}
