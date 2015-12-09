package com.gobook.adminhelp.dao;

import java.util.List;

import com.gobook.help.dto.HelpQnADto;

public interface IAdminHelpDao {
	public int getqnaBoardCount();
	public List<Integer> getqnaBoardList(int startRow, int endRow);
	public int qnaboardInsert(HelpQnADto helpQnADto);
}
