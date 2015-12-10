package com.gobook.location.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;

import com.gobook.location.dto.LocationDto;
import com.gobook.member.dto.ZipcodeDto;

/**
 * @클래스이름 : LocationDao
 * @날짜 : 2015. 12. 10.
 * @개발자 : 강주혁
 * @설명 : 지점관리 Dao
 */
@Component
public class LocationDao implements ILocationDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ZipcodeDto> zipcode(String dong) {
		return sqlSessionTemplate.selectList("dao.locationMapper.locationZipcode", dong);
	}

	@Override
	public int locationWriteInsert(LocationDto locationDto) {
		return sqlSessionTemplate.insert("dao.locationMapper.locationWriteInsert", locationDto);
	}
}
