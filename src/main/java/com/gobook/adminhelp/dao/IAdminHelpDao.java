package com.gobook.adminhelp.dao;

import java.util.List;

import com.gobook.help.dto.HelpQnADto;

public interface IAdminHelpDao {
	public int adminHelpQnACount();
	public List<HelpQnADto> adminHelpQnAListSelect(int startRow, int endRow);
	public int adminHelpQnAWriteInsert(HelpQnADto helpQnADto);
	public HelpQnADto adminHelpQnARead(int helpqna_num);
	public int adminHelpQnADelete(int helpqna_num);
	public HelpQnADto adminHelpQnASelect(int helpqna_num);
	public int adminHelpQnAUpdateOk(HelpQnADto helpQnADto);
}
