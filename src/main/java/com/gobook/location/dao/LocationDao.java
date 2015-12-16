package com.gobook.location.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gobook.location.dto.LocationDto;

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

	/**
	 * @함수이름 : locationWriteInsert
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 강주혁
	 * @설명 : 지점등록
	 */
	@Override
	public int locationWriteInsert(LocationDto locationDto) {
		return sqlSessionTemplate.insert("dao.locationMapper.locationWriteInsert", locationDto);
	}

	/**
	 * @함수이름 : locationSelect
	 * @작성일 : 2015. 12. 11.
	 * @개발자 : 강주혁
	 * @설명 : 지점목록
	 */
	@Override
	public List<LocationDto> locationSelect() {
		return sqlSessionTemplate.selectList("dao.locationMapper.locationSelectList");
	}

	/**
	 * @함수이름 : locationUpSelect
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 지점 정보가져오기
	 */
	@Override
	public LocationDto locationUpSelect(int locationNum) {
		return sqlSessionTemplate.selectOne("dao.locationMapper.locationUpSelect", locationNum);
	}

	/**
	 * @함수이름 : locationUpdate
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 지점 정보 수정
	 */
	@Override
	public int locationUpdate(LocationDto locationDto) {
		return sqlSessionTemplate.update("dao.locationMapper.locationUpdate",locationDto);
	}

	/**
	 * @함수이름 : locationDelete
	 * @작성일 : 2015. 12. 16.
	 * @개발자 : 강주혁
	 * @설명 : 지점 삭제
	 */
	@Override
	public int locationDelete(int locationNum) {
		return sqlSessionTemplate.delete("dao.locationMapper.locationDelete",locationNum);
	}
}
