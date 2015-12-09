package com.gobook.adminhelp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.help.dto.HelpQnADto;
@Component
public class AdminHelpDao implements IAdminHelpDao {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	@Autowired
	private PlatformTransactionManager transactionManager;
	@Override
	public int getqnaBoardCount() {
		
		return sessionTemplate.selectOne("dao.AdminHelpMapper.qnaboardCount");
	}
	@Override
	public List<Integer> getqnaBoardList(int startRow, int endRow) {
		Map<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		return sessionTemplate.selectList("dao.AdminHelpMapper.qnaboardList", hmap);
	}
	@Override
	public int qnaboardInsert(HelpQnADto helpQnADto) {
		
		return sessionTemplate.insert("dao.AdminHelpMapper.qnaboardInsert", helpQnADto) ;
	}

}
