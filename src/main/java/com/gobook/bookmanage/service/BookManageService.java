package com.gobook.bookmanage.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dao.IBookManageDao;
import com.gobook.bookmanage.dto.*;
import com.gobook.member.dto.UserGP;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @클래스이름 : BookManageService
 * @날짜 : 2015. 12. 8.
 * @개발자 : 성기훈
 * @설명 : 도서관리 서비스 클래스
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
		
		int bookReOrderCount=iBookManageDao.bookReOrderCount();
		int bookGroupPurchaseListCount=iBookManageDao.gpCount();
		int bookGroupPurchaseCount=iBookManageDao.bookGroupPurchaseCount();
		int bookNewPublishCount=iBookManageDao.bookNewPublishCount();
		int bookGroupPurchaseSuccessCount=iBookManageDao.bookGroupPurchaseSuccessCount();
		
		mav.addObject("id", id);
		mav.addObject("bookReOrderCount", bookReOrderCount);
		mav.addObject("bookGroupPurchaseListCount", bookGroupPurchaseListCount);
		mav.addObject("bookGroupPurchaseCount", bookGroupPurchaseCount);
		mav.addObject("bookNewPublishCount", bookNewPublishCount);
		mav.addObject("bookGroupPurchaseSuccessCount", bookGroupPurchaseSuccessCount);
		
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
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		
		try{
			if(pageNumber.equals(null)||pageNumber.equals("")) pageNumber="1";
		}catch(Exception e){}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
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
		String tempPageNumber=request.getParameter("pageNumber");
		if(tempPageNumber.equals(null)||tempPageNumber.equals("")) tempPageNumber="1";
		
		int pageNumber=Integer.parseInt(tempPageNumber);
		String pageInfo=request.getParameter("pageInfo");
		
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
			
			File path=new File("C:\\gobook\\workspace\\gobookgobook\\src\\main\\webapp\\css\\event\\images\\bookImg");
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
						try{
							book_preview_file1.transferTo(preview_file1);
							
							bookDto.setBook_preview_file_name1(book_preview_file_name1);
							
							bookDto.setBook_preview_file_path1(preview_file1.getAbsolutePath());
							
							bookDto.setBook_preview_file_size1(book_preview_file_size1);
						}catch(Exception e){
							e.printStackTrace();
						}
					}
					if(book_preview_file_size2!=0){
						File preview_file2=new File(path, book_preview_file_name2);
						try{
							book_preview_file2.transferTo(preview_file2);
							
							bookDto.setBook_preview_file_name2(book_preview_file_name2);
							
							bookDto.setBook_preview_file_path2(preview_file2.getAbsolutePath());
							
							bookDto.setBook_preview_file_size2(book_preview_file_size2);
						}catch(Exception e){
							e.printStackTrace();
						}
					}
					if(book_preview_file_size3!=0){
						File preview_file3=new File(path, book_preview_file_name3);
						try{
							book_preview_file3.transferTo(preview_file3);
							
							bookDto.setBook_preview_file_name3(book_preview_file_name3);
							
							bookDto.setBook_preview_file_path3(preview_file3.getAbsolutePath());
							
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
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("book_num", bookDto.getBook_num());
		
		mav.setViewName("bookManage/bookInsertOk");
		
	}


	/**
	 * @함수이름 : bookStockList
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 재고 도서 목록
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
		
		List<BookDto> bookStockList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookStockList=iBookManageDao.bookStockList(hMap);
		}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookStockList", bookStockList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookStockList");
		
	}


	/**
	 * @함수이름 : bookStockUpdate
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정
	 */
	@Override
	public void bookUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookDto", bookDto);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName("bookManage/bookUpdate");
	}


	/**
	 * @함수이름 : bookStockUpdateOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정
	 */
	@Override
	public void bookUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MultipartHttpServletRequest request=(MultipartHttpServletRequest)map.get("request");
		BookDto bookDto=(BookDto)map.get("bookDto");
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		
		MultipartFile book_cover_file=request.getFile("book_cover_file");
		String book_cover_file_name=book_cover_file.getOriginalFilename();
		long book_cover_file_size=book_cover_file.getSize();
		
		String old_book_cover_file_name=request.getParameter("old_book_cover_file_name");
		if(book_cover_file_size==0 && old_book_cover_file_name!=null) book_cover_file_size=Long.parseLong(request.getParameter("old_book_cover_file_size"));
		
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
			
			GoBookAspect.logger.info(GoBookAspect.logMsg + "book_preview_file_name1 : " + book_preview_file_name1);
			
			File path=new File("C:\\gobook\\workspace\\gobookgobook\\src\\main\\webapp\\css\\event\\images\\bookImg");
			path.mkdirs();
			
			if(path.exists() && path.isDirectory()){
				if(old_book_cover_file_name==null){
					File cover_file=new File(path, book_cover_file_name);
					try{
						book_cover_file.transferTo(cover_file);
						
						bookDto.setBook_cover_file_name(book_cover_file_name);
						bookDto.setBook_cover_file_path(cover_file.getAbsolutePath());
						bookDto.setBook_cover_file_size(book_cover_file_size);
						
						if(book_preview_file_size1!=0){
							File preview_file1=new File(path, book_preview_file_name1);
							try{
								book_preview_file1.transferTo(preview_file1);
								
								bookDto.setBook_preview_file_name1(book_preview_file_name1);
								
								bookDto.setBook_preview_file_path1(preview_file1.getAbsolutePath());
								
								bookDto.setBook_preview_file_size1(book_preview_file_size1);
							}catch(Exception e){
								e.printStackTrace();
							}
						}
						if(book_preview_file_size2!=0){
							File preview_file2=new File(path, book_preview_file_name2);
							try{
								book_preview_file2.transferTo(preview_file2);
								
								bookDto.setBook_preview_file_name2(book_preview_file_name2);
								
								bookDto.setBook_preview_file_path2(preview_file2.getAbsolutePath());
								
								bookDto.setBook_preview_file_size2(book_preview_file_size2);
							}catch(Exception e){
								e.printStackTrace();
							}
						}
						if(book_preview_file_size3!=0){
							File preview_file3=new File(path, book_preview_file_name3);
							try{
								book_preview_file3.transferTo(preview_file3);
								
								bookDto.setBook_preview_file_name3(book_preview_file_name3);
								
								bookDto.setBook_preview_file_path3(preview_file3.getAbsolutePath());
								
								bookDto.setBook_preview_file_size3(book_preview_file_size3);
							}catch(Exception e){
								e.printStackTrace();
							}
						}
					}catch(Exception e){
						e.printStackTrace();
					}
					
				}else{
					bookDto.setBook_cover_file_name(old_book_cover_file_name);
					bookDto.setBook_cover_file_path(request.getParameter("old_book_cover_file_path"));
					bookDto.setBook_cover_file_size(book_cover_file_size);
					
					if(book_preview_file_size1!=0){
						File preview_file1=new File(path, book_preview_file_name1);
						try{
							book_preview_file1.transferTo(preview_file1);
							
							bookDto.setBook_preview_file_name1(book_preview_file_name1);
							
							bookDto.setBook_preview_file_path1(preview_file1.getAbsolutePath());
							
							bookDto.setBook_preview_file_size1(book_preview_file_size1);
						}catch(Exception e){
							e.printStackTrace();
						}
					}
					if(book_preview_file_size2!=0){
						File preview_file2=new File(path, book_preview_file_name2);
						try{
							book_preview_file2.transferTo(preview_file2);
							
							bookDto.setBook_preview_file_name2(book_preview_file_name2);
							
							bookDto.setBook_preview_file_path2(preview_file2.getAbsolutePath());
							
							bookDto.setBook_preview_file_size2(book_preview_file_size2);
						}catch(Exception e){
							e.printStackTrace();
						}
					}
					if(book_preview_file_size3!=0){
						File preview_file3=new File(path, book_preview_file_name3);
						try{
							book_preview_file3.transferTo(preview_file3);
							
							bookDto.setBook_preview_file_name3(book_preview_file_name3);
							
							bookDto.setBook_preview_file_path3(preview_file3.getAbsolutePath());
							
							bookDto.setBook_preview_file_size3(book_preview_file_size3);
						}catch(Exception e){
							e.printStackTrace();
						}
					}
				}
			}
		}
		
		GoBookAspect.logger.info(GoBookAspect.logMsg + "book_preview_file_name1 : " + bookDto.getBook_preview_file_name1());
		
		int check=iBookManageDao.bookUpdate(bookDto);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName("bookManage/bookUpdateOk");
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
		if(gpCount>0) gpList=iBookManageDao.gpList();
		
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
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookDto", bookDto);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
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
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BookGroupPurchaseDto bookGroupPurchaseDto=(BookGroupPurchaseDto)map.get("bookGroupPurchaseDto");
		String pageNumber=null;
		String pageInfo=null;
		
		try{
			pageNumber=request.getParameter("pageNumber");
			if(pageNumber==null) pageNumber="1";
			pageInfo=request.getParameter("pageInfo");
			if(pageInfo==null) pageInfo="1";
		}catch(Exception e){}
		
		int check=iBookManageDao.bookGroupPurchaseInsert(bookGroupPurchaseDto);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
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
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		BookGroupPurchaseDto gpDto=iBookManageDao.gpRead(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("gpDto", gpDto);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
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
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BookGroupPurchaseDto bookGroupPurchaseDto=(BookGroupPurchaseDto)map.get("bookGroupPurchaseDto");
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		
		int check=iBookManageDao.bookGroupPurchaseUpdate(bookGroupPurchaseDto);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
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
		long book_num=Long.parseLong(request.getParameter("book_num"));
		
		int check=iBookManageDao.bookGroupPurchaseDelete(gp_num, book_num);
		
		mav.addObject("check", check);
		
		mav.setViewName("bookManage/bookGroupPurchaseDelete");
	}

	/**
	 * @함수이름 : bookScheduleSelect
	 * @작성일 : 2015. 12. 14.
	 * @개발자 : 성기훈
	 * @설명 : 도서 출간 일정
	 */
	@Override
	public void bookSchedule(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int count=iBookManageDao.bookCount();
		
		List<BookDto> bookList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", 1);
			hMap.put("endRow", count);
			bookList=iBookManageDao.bookList(hMap);
		}
		
		// JSONObject jsonObject = new JSONObject();		// JSONObject 생성
		JSONArray bsList = new JSONArray();				// JSONObject list 를 넣을 JSONArray
		BookDto bookDto=null;
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String root=request.getContextPath();
		for(int i=0; i<bookList.size(); i++) {			// 루프를 돌려 list에 담긴 데이터를 DTO에 주입
			bookDto = (BookDto)bookList.get(i);			// 이제 data 에는 객체들이 차례로 담겼음
			JSONObject obj = new JSONObject();			// 다시 한번 JSONObject로 감싸기 위해 객체 선언
			obj.put( "title" , bookDto.getBook_name());	// obj에 객체의 데이터를 꺼내 차례로 담는다. (key ,value) 형식
			obj.put( "start" , sdf.format(bookDto.getBook_publish_date()));
			obj.put( "url" , (root+"/bookManage/bookRead.do?book_num="+bookDto.getBook_num()+"&pageInfo=bookSchedule"));
			bsList.add(obj); // 아까 만들어진 cell Array객체에 VO담은 객체를 주입
		}
		// jsonObject.put("rows", bsList); // 마지막으로 JSON객체에 JSONArray 객체를 넣으면 끝!
		
		// GoBookAspect.logger.info(GoBookAspect.logMsg + bsList);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bsList", bsList);
		
		mav.setViewName("bookManage/bookSchedule");
	}

	/**
	 * @함수이름 : bookNewPublishList
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 성기훈
	 * @설명 : 신간 구매 희망 목록
	 */
	@Override
	public void bookNewPublishList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookNewPublishCount();
		// GoBookAspect.logger.info(GoBookAspect.logMsg + "count:" + count);
		
		List<BookDto> bookNewPublishList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookNewPublishList=iBookManageDao.bookNewPublishList(hMap);
			// GoBookAspect.logger.info(GoBookAspect.logMsg + "bookNewPublishList:" + bookNewPublishList.size());
		}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookNewPublishList", bookNewPublishList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookNewPublishList");
		
	}

	/**
	 * @함수이름 : bookList
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서목록
	 */
	@Override
	public void bookList(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookCount();
		
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
		
		mav.setViewName("bookManage/bookList");
		
	}

	/**
	 * @함수이름 : bookRead
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서 세부 정보
	 */
	@Override
	public void bookRead(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		
		if(pageNumber==null) pageNumber="0";
		
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		mav.addObject("bookDto", bookDto);
		
		mav.setViewName("bookManage/bookRead");
		
	}

	/**
	 * @함수이름 : bookStockUpdate
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 입고 요청
	 */
	@Override
	public void bookStockUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookDto", bookDto);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName("bookManage/bookStockUpdate");
	}

	/**
	 * @함수이름 : bookStockUpdateOk
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 입고 요청
	 */
	@Override
	public void bookStockUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		String pageInfo=request.getParameter("pageInfo");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		int reorder_quantity=Integer.parseInt(request.getParameter("reorder_quantity"));
		
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		bookDto.setBook_quantity(bookDto.getBook_quantity()+reorder_quantity);
		
		int check=iBookManageDao.bookStockUpdate(bookDto, reorder_quantity);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName("bookManage/bookStockUpdateOk");
	}

	/**
	 * @함수이름 : bookSpecialPriceUpdate
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서 특가 설정
	 */
	@Override
	public void bookSpecialPriceUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		String pageNumber=request.getParameter("pageNumber");
		long book_num=Long.parseLong(request.getParameter("book_num"));
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookDto", bookDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("bookManage/bookSpecialPriceUpdate");
		
	}

	/**
	 * @함수이름 : bookSpecialPriceUpdateOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서 특가 설정
	 */
	@Override
	public void bookSpecialPriceUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		BookDto bookDto=(BookDto)map.get("bookDto");
		
		String pageNumber=request.getParameter("pageNumber");
		
		bookDto.setBook_state(5);
		
		int check=iBookManageDao.bookSpecialPriceUpdate(bookDto);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("bookManage/bookSpecialPriceUpdateOk");
		
	}

	/**
	 * @함수이름 : bookSpecialPriceCancle
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 특가 설정 취소
	 */
	@Override
	public void bookSpecialPriceCancle(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		String pageNumber=request.getParameter("pageNumber");
		BookDto bookDto=iBookManageDao.bookInfo(book_num);
		bookDto.setBook_price((bookDto.getBook_cost())*2);
		if(bookDto.getBook_quantity()>0) bookDto.setBook_state(1);
		else bookDto.setBook_state(0);
		
		int check=iBookManageDao.bookSpecialPriceCancle(bookDto);
		
		mav.addObject("check", check);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("bookManage/bookSpecialPriceCancle");
	}

	/**
	 * @함수이름 : bookSpecialPrice
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서 특가 목록
	 */
	@Override
	public void bookSpecialPrice(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int boardSize=10;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iBookManageDao.bookSpecialPriceCount();
		
		List<BookDto> bookSpecialPriceList=null;
		if(count>0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			bookSpecialPriceList=iBookManageDao.bookSpecialPriceList(hMap);
		}
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookSpecialPriceList", bookSpecialPriceList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("boardSize", boardSize);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookSpecialPrice");
		
	}

	/**
	 * @함수이름 : bookGroupPurchaseSuccess
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 공구조건충족 공구진행 목록
	 */
	@Override
	public void bookGroupPurchaseSuccess(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		List<BookGroupPurchaseDto> bookGroupPurchaseSuccess=iBookManageDao.bookGroupPurchaseSuccess();
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("bookGroupPurchaseSuccess", bookGroupPurchaseSuccess);
		
		mav.setViewName("bookManage/bookGroupPurchaseSuccess");
	}

	/**
	 * @함수이름 : gpSuccessConfirm
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 승인후 사용자 장바구니 담기
	 */
	@Override
	public void gpSuccessConfirm(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		long book_num=Long.parseLong(request.getParameter("book_num"));
		int gp_num=Integer.parseInt(request.getParameter("gp_num"));
		int group_purchase_price=Integer.parseInt(request.getParameter("group_purchase_price"));
		
		List<String> member_id=iBookManageDao.memberIdList(gp_num);
		// GoBookAspect.logger.info(GoBookAspect.logMsg + "member_id:" + member_id.size());
		
		for(int i=0;i<member_id.size();i++){
			HashMap<String, Object> hMap=new HashMap<String, Object>();
			hMap.put("book_num", book_num);
			hMap.put("gp_num", gp_num);
			hMap.put("group_purchase_price", group_purchase_price);
			hMap.put("member_id", member_id.get(i));
			
			iBookManageDao.mbinsert(hMap);
		}
		
		int count=iBookManageDao.gpStatusUpdate(gp_num);
		
		// GoBookAspect.logger.info(GoBookAspect.logMsg + "count:" + count);
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		mav.addObject("count", count);
		
		mav.setViewName("bookManage/bookGroupPurchaseSuccessOk");
		
	}
	
	
}
