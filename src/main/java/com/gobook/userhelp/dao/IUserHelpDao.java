package com.gobook.userhelp.dao;

import java.util.HashMap;
import java.util.List;

import com.gobook.help.dto.HelpNoticeDto;
import com.gobook.help.dto.HelpQnADto;



public interface IUserHelpDao {
	public int userHelpPvPInsert(HashMap<String, Object> map);
	
	public int userHelpQnACount();
	public List<HelpQnADto> userHelpQnASelect(int startRow, int endRow);
	public HelpQnADto userHelpQnARead(int helpqna_num);
	
	public int userHelpNoticeCount();
	public List<HelpNoticeDto> userHelpNoticeSelect(int startRow, int endRow);
	public HelpNoticeDto userHelpNoticeRead(int helpnotice_num);
}
