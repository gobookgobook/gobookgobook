package com.gobook.bookmanage.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dto.BookDto;
import com.gobook.bookmanage.dto.BookGroupPurchaseDto;
import com.gobook.bookmanage.dto.BookReOrderDto;

/**
 * @클래스이름 : BookManageDao
 * @날짜 : 2015. 12. 18.
 * @개발자 : 성기훈
 * @설명 : 도서관리 DAO
 */
@Component
public class BookManageDao implements IBookManageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	/**
	 * @함수이름 : bookInsert
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정
	 */
	@Override
	public int bookInsert(BookDto bookDto) {
		
		return sqlSessionTemplate.insert("dao.bookmanageMapper.bookInsert", bookDto);
	}

	/**
	 * @함수이름 : bookStockCount
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 도서재고목록 수량(페이지 카운트)
	 */
	@Override
	public int bookStockCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookStockCount");
	}

	/**
	 * @함수이름 : bookList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 도서재고목록
	 */
	@Override
	public List<BookDto> bookStockList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookStockList", hMap);
	}

	/**
	 * @함수이름 : bookInfo
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 도서정보
	 */
	@Override
	public BookDto bookInfo(long book_num) {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookInfo", book_num);
	}

	/**
	 * @함수이름 : bookStockUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 도서수정(입고, 재입고)
	 */
	@Override
	public int bookStockUpdate(BookDto bookDto, int reorder_quantity) {
		TransactionDefinition definition=new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		int reorder_total_price=reorder_quantity*bookDto.getBook_cost();
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("book_num", bookDto.getBook_num());
		hMap.put("book_name", bookDto.getBook_name());
		hMap.put("reorder_quantity", reorder_quantity);
		hMap.put("book_cost", bookDto.getBook_cost());
		hMap.put("reorder_total_price", reorder_total_price);
		
		int value=0;
		try{			
			if(bookDto.getBook_state()!=2) {
				sqlSessionTemplate.insert("dao.bookmanageMapper.bookReOrderInsert", hMap);
			}
			sqlSessionTemplate.insert("dao.bookmanageMapper.salesMonthListInsert", hMap);
			
			bookDto.setBook_state(1);
			bookDto.setBook_reorder_count(0);
			
			value=sqlSessionTemplate.update("dao.bookmanageMapper.bookStockUpdate", bookDto);
			
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
			e.printStackTrace();
		}
		return value;
	}
	
	/**
	 * @함수이름 : bookReOrderListCount
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 목록 페이지 카운트
	 */
	@Override
	public int bookReOrderListCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookReOrderListCount");
	}

	/**
	 * @함수이름 : bookReOrderList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 목록
	 */
	@Override
	public List<BookReOrderDto> bookReOrderList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookReOrderList", hMap);
	}

	/**
	 * @함수이름 : bookReOrderCount
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 요청 목록 페이지 카운트
	 */
	@Override
	public int bookReOrderCount() {

		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookReOrderCount");
	}

	/**
	 * @함수이름 : bookReOrderCountList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 재입고 요청 목록
	 */
	@Override
	public List<BookDto> bookReOrderCountList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookReOrderCountList", hMap);
	}

	/**
	 * @함수이름 : bookGroupPurchaseCount
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 요청 목록 페이지 카운트
	 */
	@Override
	public int bookGroupPurchaseCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookGroupPurchaseCount");
	}

	/**
	 * @함수이름 : bookGroupPurchaseCountList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 요청 목록
	 */
	@Override
	public List<BookDto> bookGroupPurchaseCountList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookGroupPurchaseCountList", hMap);
	}

	/**
	 * @함수이름 : bookSoldOutCount
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 품절도서 목록 페이지카운트
	 */
	@Override
	public int bookSoldOutCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookSoldOutCount");
	}

	/**
	 * @함수이름 : bookSoldOutList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 품절도서 목록
	 */
	@Override
	public List<BookDto> bookSoldOutList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookSoldOutList", hMap);
	}

	/**
	 * @함수이름 : bookGroupPurchaseInsert
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 등록
	 */
	@Override
	public int bookGroupPurchaseInsert(BookGroupPurchaseDto bookGroupPurchaseDto) {
		sqlSessionTemplate.update("dao.bookmanageMapper.GroupPurchaseInit", bookGroupPurchaseDto);
		return sqlSessionTemplate.insert("dao.bookmanageMapper.bookGroupPurchaseInsert", bookGroupPurchaseDto);
	}

	/**
	 * @함수이름 : gpCount
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 목록 카운트
	 */
	@Override
	public int gpCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.gpCount");
	}

	/**
	 * @함수이름 : gpList
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 목록
	 */
	@Override
	public List<BookGroupPurchaseDto> gpList() {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.gpList");
	}

	/**
	 * @함수이름 : gpRead
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 세부정보
	 */
	@Override
	public BookGroupPurchaseDto gpRead(long book_num) {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.BookGroupPurchaseDto", book_num);
	}

	/**
	 * @함수이름 : bookGroupPurchaseUpdate
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 수정
	 */
	@Override
	public int bookGroupPurchaseUpdate(BookGroupPurchaseDto bookGroupPurchaseDto) {
		
		return sqlSessionTemplate.update("dao.bookmanageMapper.bookGroupPurchaseUpdate", bookGroupPurchaseDto);
	}

	/**
	 * @함수이름 : bookGroupPurchaseDelete
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 성기훈
	 * @설명 : 공동구매 등록 취소
	 */
	@Override
	public int bookGroupPurchaseDelete(int gp_num, long book_num) {
		sqlSessionTemplate.update("dao.bookmanageMapper.bookGroupPurchaseDeleteInit", book_num);
		return sqlSessionTemplate.update("dao.bookmanageMapper.bookGroupPurchaseDelete", gp_num);
	}

	/**
	 * @함수이름 : bookNewPublishCount
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 성기훈
	 * @설명 : 신간 구매 희망 요청수
	 */
	@Override
	public int bookNewPublishCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookNewPublishCount");
	}

	/**
	 * @함수이름 : bookNewPublishList
	 * @작성일 : 2015. 12. 18.
	 * @개발자 : 성기훈
	 * @설명 : 신간 구매 희망 목록
	 */
	@Override
	public List<BookDto> bookNewPublishList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookNewPublishList", hMap);
	}

	/**
	 * @함수이름 : bookList
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서목록
	 */
	@Override
	public List<BookDto> bookList(HashMap<String, Integer> hMap) {

		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookList", hMap);
	}

	/**
	 * @함수이름 : bookCount
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서수량
	 */
	@Override
	public int bookCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookCount");
	}

	/**
	 * @함수이름 : bookUpdate
	 * @작성일 : 2015. 12. 22.
	 * @개발자 : 성기훈
	 * @설명 : 도서 정보 수정
	 */
	@Override
	public int bookUpdate(BookDto bookDto) {
		int value=0;
		
		if(bookDto.getBook_cover_file_name()==null){
			value=sqlSessionTemplate.update("dao.bookmanageMapper.bookUpdate", bookDto);
		}else{
			value=sqlSessionTemplate.update("dao.bookmanageMapper.bookUpdateCoverFile", bookDto);	
		}
		
		if(bookDto.getBook_preview_file_name1()!=null){
			sqlSessionTemplate.update("dao.bookmanageMapper.bookUpdatePreviewFileOne", bookDto);
		}
		
		if(bookDto.getBook_preview_file_name2()!=null){
			sqlSessionTemplate.update("dao.bookmanageMapper.bookUpdatePreviewFileTwo", bookDto);
		}
		
		if(bookDto.getBook_preview_file_name3()!=null){
			sqlSessionTemplate.update("dao.bookmanageMapper.bookUpdatePreviewFileThree", bookDto);
		}
		
		return value;
	}

	/**
	 * @함수이름 : bookPriceUpdate
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서 특가 설정
	 */
	@Override
	public int bookSpecialPriceUpdate(BookDto bookDto) {
		
		return sqlSessionTemplate.update("dao.bookmanageMapper.bookSpecialPriceUpdate", bookDto);
	}

	/**
	 * @함수이름 : bookSpecialPriceCancle
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 도서 특가 취소
	 */
	@Override
	public int bookSpecialPriceCancle(BookDto bookDto) {
		
		return sqlSessionTemplate.update("dao.bookmanageMapper.bookSpecialPriceCancle", bookDto);
	}

	/**
	 * @함수이름 : bookSpecialPriceCount
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 특가 도서 수량
	 */
	@Override
	public int bookSpecialPriceCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookSpecialPriceCount");
	}

	/**
	 * @함수이름 : bookSpecialPriceList
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 특가 도서 목록
	 */
	@Override
	public List<BookDto> bookSpecialPriceList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookSpecialPriceList", hMap);
	}

	/**
	 * @함수이름 : bookGroupPurchaseSuccess
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 성기훈
	 * @설명 : 공구 조건 만족 공구 진행 목록수
	 */
	@Override
	public int bookGroupPurchaseSuccess() {
		int value=0;
		int val=0;
		value=sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookGroupPurchaseSuccess");
		val=sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookGroupPurchaseSuccessMax");
		return value+val;
	}
	
	
}
