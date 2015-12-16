package com.gobook.userhelp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.help.dto.HelpNoticeDto;
import com.gobook.help.dto.HelpPvPDto;
import com.gobook.help.dto.HelpQnADto;
import com.gobook.location.dto.LocationDto;
@Component
public class UserHelpDao implements IUserHelpDao {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int userHelpPvPInsert(HashMap<String, Object> map) {
	
		return sqlSessionTemplate.insert("dao.UserHelpMapper.userHelpPvPInsert",map);
	}

	@Override
	public int userHelpQnACount() {
		
		return sqlSessionTemplate.selectOne("dao.UserHelpMapper.userHelpQnACount");
	}

	@Override
	public List<HelpQnADto> userHelpQnASelect(int startRow, int endRow) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return sqlSessionTemplate.selectList("dao.UserHelpMapper.userHelpQnASelect",map);
	}

	@Override
	public HelpQnADto userHelpQnARead(int helpqna_num) {
		
		return sqlSessionTemplate.selectOne("dao.UserHelpMapper.userHelpQnARead",helpqna_num);
	}

	@Override
	public int userHelpNoticeCount() {
		
		return sqlSessionTemplate.selectOne("dao.UserHelpMapper.userHelpNoticeCount");
	}

	@Override
	public List<HelpNoticeDto> userHelpNoticeSelect(int startRow, int endRow) {
		Map<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		
		return sqlSessionTemplate.selectList("dao.UserHelpMapper.userHelpNoticeSelect",hmap);
	}

	@Override
	public HelpNoticeDto userHelpNoticeRead(int helpnotice_num) {
		
		return sqlSessionTemplate.selectOne("dao.UserHelpMapper.userHelpNoticeRead",helpnotice_num);
	}

	/**
	 * @함수이름 : userHelpLocation
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 오프라인 지점 안내
	 */
	@Override
	public List<LocationDto> userHelpLocation() {
		return sqlSessionTemplate.selectList("dao.UserHelpMapper.userHelpLocation");
	}




}
