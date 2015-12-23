package com.gobook.userhelp.dao;

import java.util.HashMap;
import java.util.List;

import com.gobook.help.dto.HelpNoticeDto;
import com.gobook.help.dto.HelpQnADto;
import com.gobook.location.dto.LocationDto;

/**
 * @클래스이름 : IUserHelpDao
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 사용자 고객센터 Dao 인터페이스
 */
public interface IUserHelpDao {
	public int userHelpPvPInsert(HashMap<String, Object> map);
	
	public int userHelpQnACount();
	public List<HelpQnADto> userHelpQnASelect(int startRow, int endRow);
	public HelpQnADto userHelpQnARead(int helpqna_num);
	
	public int userHelpNoticeCount();
	public List<HelpNoticeDto> userHelpNoticeSelect(int startRow, int endRow);
	public HelpNoticeDto userHelpNoticeRead(int helpnotice_num);
	
	public List<LocationDto> userHelpLocation();
}
