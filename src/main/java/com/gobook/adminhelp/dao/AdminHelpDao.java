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
@Component
public class AdminHelpDao implements IAdminHelpDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;
	
	@Override
	public int adminHelpQnACount() {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpQnACount");
	}
	@Override
	public List<HelpQnADto> adminHelpQnAListSelect(int startRow, int endRow) {
		Map<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.AdminHelpMapper.adminHelpQnAListSelect", hmap);
	}
	@Override
	public int adminHelpQnAWriteInsert(HelpQnADto helpQnADto) {
		
		return sqlSessionTemplate.insert("dao.AdminHelpMapper.adminHelpQnAWriteInsert", helpQnADto) ;
	}
	@Override
	public HelpQnADto adminHelpQnARead(int helpqna_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpQnARead",helpqna_num);
	}
	@Override
	public int adminHelpQnADelete(int helpqna_num) {
		
		return sqlSessionTemplate.delete("dao.AdminHelpMapper.adminHelpQnADelete",helpqna_num);
	}
	@Override
	public HelpQnADto adminHelpQnASelect(int helpqna_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpQnASelect",helpqna_num);
	}
	@Override
	public int adminHelpQnAUpdateOk(HelpQnADto helpQnADto) {
		
		return sqlSessionTemplate.update("dao.AdminHelpMapper.adminHelpQnAUpdateOk",helpQnADto);
	}
	@Override
	public int adminHelpNoticeWriteInsert(HelpNoticeDto helpNoticeDto) {
		
		return sqlSessionTemplate.insert("dao.AdminHelpMapper.adminHelpNoticeWriteInsert",helpNoticeDto);
	}
	@Override
	public int adminHelpNoticeCount() {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpNoticeCount");
	}
	@Override
	public List<HelpNoticeDto> adminHelpNoticeListSelect(HashMap<String, Integer> hMap) {
		
		return sqlSessionTemplate.selectList("dao.AdminHelpMapper.adminHelpNoticeListSelect",hMap);
	}
	@Override
	public HelpNoticeDto adminHelpNoticeRead(int helpnotice_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpNoticeRead", helpnotice_num);
	}
	@Override
	public int adminHelpNoticeDelete(int helpnotice_num) {
		
		return sqlSessionTemplate.delete("dao.AdminHelpMapper.adminHelpNoticeDelete", helpnotice_num);
	}
	@Override
	public HelpNoticeDto adminHelpNoticeSelect(int helpnotice_num) {
		
		return sqlSessionTemplate.selectOne("dao.AdminHelpMapper.adminHelpNoticeSelect", helpnotice_num);
	}
	@Override
	public int adminHelpNoticeUpdateOk(HelpNoticeDto helpNoticeDto) {
		
		return sqlSessionTemplate.update("dao.AdminHelpMapper.adminHelpNoticeUpdateOk", helpNoticeDto);
	}
	
}
