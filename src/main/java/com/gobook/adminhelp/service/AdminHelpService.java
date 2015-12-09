package com.gobook.adminhelp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.adminhelp.dao.IAdminHelpDao;
import com.gobook.aop.GoBookAspect;
import com.gobook.help.dto.HelpQnADto;
@Component
public class AdminHelpService implements IAdminHelpService {
	@Autowired
	private IAdminHelpDao iadminHelpDao;

	@Override
	public void adminHelpQnAList(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int boardSize=5;
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int qnaboardCount=iadminHelpDao.getqnaBoardCount();
		GoBookAspect.logger.info(GoBookAspect.logMsg+qnaboardCount);
		
		List<Integer> qnaboardList=null;
		if(qnaboardCount > 0){
			qnaboardList=iadminHelpDao.getqnaBoardList(startRow, endRow);
		}
		GoBookAspect.logger.info(GoBookAspect.logMsg + qnaboardList.size());
		
		mav.addObject("qnaboardList", qnaboardList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("qnaboardCount", qnaboardCount);
		mav.addObject("boardSize", boardSize);
		mav.setViewName("help/adminHelpQnAList");
	}

	@Override
	public void adminHelpQnAWriteOk(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HelpQnADto helpQnADto=(HelpQnADto) hmap.get("helpQnADto");
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
//		qnaboardWriteNumber(helpQnADto);
		int qnaboardcheck=iadminHelpDao.qnaboardInsert(helpQnADto);
		//System.out.println("qnaboardcheck:" + qnaboardcheck);
		
		int helpqna_num=helpQnADto.getHelpqna_num();
		int qnagroup_number=helpQnADto.getQnagroup_number();
		int qnasequence_number=helpQnADto.getQnasequence_number();
		int qnasequence_level=helpQnADto.getQnasequence_level();
		
		mav.addObject("helpqna_num", helpqna_num);
		mav.addObject("qnagroup_number", qnagroup_number);
		mav.addObject("qnasequence_number", qnasequence_number);
		mav.addObject("qnasequence_level", qnasequence_level);
		mav.addObject("qnaboardcheck", qnaboardcheck);
		
		mav.setViewName("help/adminHelpQnAWriteOk");
	}
}	


