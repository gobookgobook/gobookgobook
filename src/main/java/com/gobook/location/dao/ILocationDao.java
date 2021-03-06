package com.gobook.location.dao;

import java.util.List;

import com.gobook.location.dto.LocationDto;

/**
 * @클래스이름 : ILocationDao
 * @날짜 : 2015. 12. 10.
 * @개발자 : 강주혁
 * @설명 : 지점관리 Dao Interface
 */
public interface ILocationDao {
	public int locationWriteInsert(LocationDto locationDto);
	public List<LocationDto> locationSelect();
	public LocationDto locationUpSelect(int locationNum);
	public int locationUpdate(LocationDto locationDto);
	public int locationDelete(int locationNum);
}
