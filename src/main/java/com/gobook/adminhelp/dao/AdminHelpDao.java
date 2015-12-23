package com.gobook.adminhelp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.help.dto.HelpNoticeDto;
//import com.gobook.help.dto.HelpPvPDto;
import com.gobook.help.dto.HelpQnADto;

/**
 * @클래스이름 : AdminHelpDao
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 관리자 고객센터 Dao
 */
@Component
public class AdminHelpDao implements IAdminHelpDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	/**
	 * @함수이름 : adminHelpQnACount
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 목록 개수
	 */
	@Override
	public int adminHelpQnACount() {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpQnACount");
	}
	
	/**
	 * @함수이름 : adminHelpQnAListSelect
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 목록
	 */
	@Override
	public List<HelpQnADto> adminHelpQnAListSelect(int startRow, int endRow) {
		Map<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminHelpMapper.adminHelpQnAListSelect", hmap);
	}
	
	/**
	 * @함수이름 : adminHelpQnAWriteInsert
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 등록
	 */
	@Override
	public int adminHelpQnAWriteInsert(HelpQnADto helpQnADto) {
		
		return sqlSessionTemplate.insert("dao.AdminHelpMapper.adminHelpQnAWriteInsert", helpQnADto) ;
	}
	
	/**
	 * @함수이름 : adminHelpQnARead
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 읽기
	 */
	@Override
	public HelpQnADto adminHelpQnARead(int helpqna_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpQnARead",helpqna_num);
	}
	
	/**
	 * @함수이름 : adminHelpQnADelete
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 삭제
	 */
	@Override
	public int adminHelpQnADelete(int helpqna_num) {
		
		return sqlSessionTemplate.delete("dao.AdminHelpMapper.adminHelpQnADelete",helpqna_num);
	}
	
	/**
	 * @함수이름 : adminHelpQnASelect
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 수정할 Q&A 정보 읽기
	 */
	@Override
	public HelpQnADto adminHelpQnASelect(int helpqna_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpQnASelect",helpqna_num);
	}
	
	/**
	 * @함수이름 : adminHelpQnAUpdateOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 Q&A 수정
	 */
	@Override
	public int adminHelpQnAUpdateOk(HelpQnADto helpQnADto) {
		
		return sqlSessionTemplate.update("dao.AdminHelpMapper.adminHelpQnAUpdateOk",helpQnADto);
	}
	
	/**
	 * @함수이름 : adminHelpNoticeWriteInsert
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 등록
	 */
	@Override
	public int adminHelpNoticeWriteInsert(HelpNoticeDto helpNoticeDto) {
		
		return sqlSessionTemplate.insert("dao.AdminHelpMapper.adminHelpNoticeWriteInsert",helpNoticeDto);
	}
	
	/**
	 * @함수이름 : adminHelpNoticeCount
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 목록 개수
	 */
	@Override
	public int adminHelpNoticeCount() {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpNoticeCount");
	}
	
	/**
	 * @함수이름 : adminHelpNoticeListSelect
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 목록
	 */
	@Override
	public List<HelpNoticeDto> adminHelpNoticeListSelect(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.AdminHelpMapper.adminHelpNoticeListSelect",hMap);
	}
	
	/**
	 * @함수이름 : adminHelpNoticeRead
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 읽기
	 */
	@Override
	public HelpNoticeDto adminHelpNoticeRead(int helpnotice_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpNoticeRead", helpnotice_num);
	}
	
	/**
	 * @함수이름 : adminHelpNoticeDelete
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 삭제
	 */
	@Override
	public int adminHelpNoticeDelete(int helpnotice_num) {
		
		return sqlSessionTemplate.delete("dao.AdminHelpMapper.adminHelpNoticeDelete", helpnotice_num);
	}
	
	/**
	 * @함수이름 : adminHelpNoticeSelect
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 수정할 공지사항 정보 읽기
	 */
	@Override
	public HelpNoticeDto adminHelpNoticeSelect(int helpnotice_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpNoticeSelect", helpnotice_num);
	}
	
	/**
	 * @함수이름 : adminHelpNoticeUpdateOk
	 * @작성일 : 2015. 12. 23.
	 * @개발자 : 조재웅
	 * @설명 : 관리자 공지사항 수정
	 */
	@Override
	public int adminHelpNoticeUpdateOk(HelpNoticeDto helpNoticeDto) {
		
		return sqlSessionTemplate.update("dao.AdminHelpMapper.adminHelpNoticeUpdateOk", helpNoticeDto);
	}
}