package com.gobook.adminhelp.dao;

import java.util.HashMap;
import java.util.List;

import com.gobook.help.dto.HelpNoticeDto;
//import com.gobook.help.dto.HelpPvPDto;
import com.gobook.help.dto.HelpQnADto;

/**
 * @클래스이름 : IAdminHelpDao
 * @날짜 : 2015. 12. 23.
 * @개발자 : 조재웅
 * @설명 : 관리자 고객센터 Dao 인터페이스
 */
public interface IAdminHelpDao {
	public int adminHelpQnACount();
	public List<HelpQnADto> adminHelpQnAListSelect(int startRow, int endRow);
	public int adminHelpQnAWriteInsert(HelpQnADto helpQnADto);
	public HelpQnADto adminHelpQnARead(int helpqna_num);
	public int adminHelpQnADelete(int helpqna_num);
	public HelpQnADto adminHelpQnASelect(int helpqna_num);
	public int adminHelpQnAUpdateOk(HelpQnADto helpQnADto);
	
	public int adminHelpNoticeWriteInsert(HelpNoticeDto helpNoticeDto);
	public int adminHelpNoticeCount();
	public List<HelpNoticeDto> adminHelpNoticeListSelect(HashMap<String, Integer> hMap);
	public HelpNoticeDto adminHelpNoticeRead(int helpnotice_num);
	public int adminHelpNoticeDelete(int helpnotice_num);
	public HelpNoticeDto adminHelpNoticeSelect(int helpnotice_num);
	public int adminHelpNoticeUpdateOk(HelpNoticeDto helpNoticeDto);
	
}
