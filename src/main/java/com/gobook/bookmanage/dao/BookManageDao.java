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

@Component
public class BookManageDao implements IBookManageDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	private PlatformTransactionManager transactionManager;

	@Override
	public int bookInsert(BookDto bookDto) {
		
		return sqlSessionTemplate.insert("dao.bookmanageMapper.bookInsert", bookDto);
	}

	@Override
	public int bookStockCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookStockCount");
	}

	@Override
	public List<BookDto> bookList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookList", hMap);
	}

	@Override
	public BookDto bookInfo(long book_num) {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookInfo", book_num);
	}

	@Override
	public int bookStockUpdate(BookDto bookDto, int reorder_quantity) {
		TransactionDefinition definition=new DefaultTransactionDefinition();
		TransactionStatus status = transactionManager.getTransaction(definition);
		
		int reorder_price=reorder_quantity*bookDto.getBook_cost();
		
		HashMap<String, Object> hMap=new HashMap<String, Object>();
		hMap.put("book_num", bookDto.getBook_num());
		hMap.put("book_name", bookDto.getBook_name());
		hMap.put("reorder_quantity", reorder_quantity);
		hMap.put("book_cost", bookDto.getBook_cost());
		hMap.put("reorder_price", reorder_price);
		
		int value=0;
		try{			
			if(reorder_quantity!=0){
				if(bookDto.getBook_state()!=2) {
					sqlSessionTemplate.insert("dao.bookmanageMapper.bookReOrderInsert", hMap);
				}
				sqlSessionTemplate.insert("dao.bookmanageMapper.salesMonthListInsert", hMap);
			}
			GoBookAspect.logger.info(GoBookAspect.logMsg + "DAO bookDto.getBook_reorder_count : "+bookDto.getBook_reorder_count());
			value=sqlSessionTemplate.update("dao.bookmanageMapper.bookStockUpdate", bookDto);
			
			transactionManager.commit(status);
		}catch(Exception e){
			transactionManager.rollback(status);
			e.printStackTrace();
		}
		return value;
	}
	
	@Override
	public int bookReOrderListCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookReOrderListCount");
	}

	@Override
	public List<BookReOrderDto> bookReOrderList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookReOrderList", hMap);
	}

	@Override
	public int bookReOrderCount() {

		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookReOrderCount");
	}

	@Override
	public List<BookDto> bookReOrderCountList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookReOrderCountList", hMap);
	}

	@Override
	public int bookGroupPurchaseCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookGroupPurchaseCount");
	}

	@Override
	public List<BookDto> bookGroupPurchaseCountList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookGroupPurchaseCountList", hMap);
	}

	@Override
	public int bookSoldOutCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.bookSoldOutCount");
	}

	@Override
	public List<BookDto> bookSoldOutList(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.bookSoldOutList", hMap);
	}

	@Override
	public int bookGroupPurchaseInsert(BookGroupPurchaseDto bookGroupPurchaseDto) {
		sqlSessionTemplate.update("dao.bookmanageMapper.GroupPurchaseInit", bookGroupPurchaseDto);
		return sqlSessionTemplate.insert("dao.bookmanageMapper.bookGroupPurchaseInsert", bookGroupPurchaseDto);
	}

	@Override
	public int gpCount() {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.gpCount");
	}

	@Override
	public List<BookGroupPurchaseDto> gpList() {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.gpList");
	}

	@Override
	public List<BookDto> gpBookList() {
		
		return sqlSessionTemplate.selectList("dao.bookmanageMapper.gpBookList");
	}

	@Override
	public BookGroupPurchaseDto gpRead(int gp_num) {
		
		return sqlSessionTemplate.selectOne("dao.bookmanageMapper.BookGroupPurchaseDto", gp_num);
	}

	@Override
	public int bookGroupPurchaseUpdate(BookGroupPurchaseDto bookGroupPurchaseDto) {
		
		return sqlSessionTemplate.update("dao.bookmanageMapper.bookGroupPurchaseUpdate", bookGroupPurchaseDto);
	}
	
	
}
