package com.gobook.adminhelp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.adminhelp.dao.IAdminHelpDao;
import com.gobook.aop.GoBookAspect;
import com.gobook.help.dto.HelpNoticeDto;
//import com.gobook.help.dto.HelpPvPDto;
import com.gobook.help.dto.HelpQnADto;
@Component
public class AdminHelpService implements IAdminHelpService {
	@Autowired
	private IAdminHelpDao iAdminHelpDao;
	
	@Override
	public void adminHelpQnAWrite(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		mav.addObject("request", request);
		
		mav.setViewName("help/adminHelpQnAWrite");	
	}	
	
	@Override
	public void adminHelpQnAWriteOk(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HelpQnADto helpQnADto=(HelpQnADto) hmap.get("helpQnADto");
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int check=iAdminHelpDao.adminHelpQnAWriteInsert(helpQnADto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "check:" + check);
		
		int helpqna_num=helpQnADto.getHelpqna_num();
		
		mav.addObject("helpQnADto", helpQnADto);
		mav.addObject("helpqna_num", helpqna_num);
		mav.addObject("check", check);
		mav.setViewName("help/adminHelpQnAWriteOk");
	}

	@Override
	public void adminHelpQnAList(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		//HelpQnADto helpQnADto=(HelpQnADto) hmap.get("helpQnADto");
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int boardSize=5;
		String pageNumber=request.getParameter("pageNumber");
		
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iAdminHelpDao.adminHelpQnACount();
		GoBookAspect.logger.info(GoBookAspect.logMsg+"adminHelpQnACount:" + count);
		
		List<HelpQnADto> adminHelpQnAList=null;
		if(count > 0){
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			adminHelpQnAList=iAdminHelpDao.adminHelpQnAListSelect(startRow, endRow);
			GoBookAspect.logger.info(GoBookAspect.logMsg + adminHelpQnAList.size());
		}
//		String helpqna_content=request.getParameter("helpqna_content");
		
		
		
		mav.addObject("adminHelpQnAList", adminHelpQnAList);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
//		mav.addObject("helpqna_content", helpqna_content);
		
		mav.setViewName("help/adminHelpQnAList");
	}

	@Override
	public void adminHelpQnARead(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpqna_num=Integer.parseInt(request.getParameter("helpqna_num"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + helpqna_num + "\t" + pageNumber);
		
		HelpQnADto HelpQnADto=iAdminHelpDao.adminHelpQnARead(helpqna_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + HelpQnADto);
		
		mav.addObject("HelpQnADto", HelpQnADto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("help/adminHelpQnARead");
	}

	@Override
	public void adminHelpQnADelete(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpqna_num=Integer.parseInt(request.getParameter("helpqna_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg+ "helpqna_num:" + helpqna_num );
		
		int check=iAdminHelpDao.adminHelpQnADelete(helpqna_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg+ "check:" + check );
		
		mav.addObject("check", check);
		mav.setViewName("help/adminHelpQnADelete");
		
	}

	@Override
	public void adminHelpQnAUpdate(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpqna_num=Integer.parseInt(request.getParameter("helpqna_num"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		GoBookAspect.logger.info(GoBookAspect.logMsg+ "helpqna_num:" + helpqna_num + "pageNumber:"+ pageNumber );
		
		HelpQnADto helpQnADto=iAdminHelpDao.adminHelpQnASelect(helpqna_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg+ "helpQnADto:" + helpQnADto);
	
		mav.addObject("helpQnADto",helpQnADto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("help/adminHelpQnAUpdate");
		
	}

	@Override
	public void adminHelpQnAUpdateOk(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		HelpQnADto helpQnADto=(HelpQnADto) hmap.get("helpQnADto");
		GoBookAspect.logger.info(GoBookAspect.logMsg +"helpQnADto:" + helpQnADto.getHelpqna_subject());
		GoBookAspect.logger.info(GoBookAspect.logMsg +"helpQnADto:" + helpQnADto.getHelpqna_num());
		GoBookAspect.logger.info(GoBookAspect.logMsg +"helpQnADto:" + helpQnADto.getHelpqna_content());
		
		int check=iAdminHelpDao.adminHelpQnAUpdateOk(helpQnADto);
		GoBookAspect.logger.info(GoBookAspect.logMsg +"helpQnADto:" + helpQnADto);
		
		
		mav.addObject("helpQnADto", helpQnADto);
		mav.addObject("check", check);
		
		mav.setViewName("/help/adminHelpQnAUpdateOk");
	}

	@Override
	public void adminHelpNoticeWriteOk(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HelpNoticeDto helpNoticeDto=(HelpNoticeDto) hmap.get("helpNoticeDto");
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int check=iAdminHelpDao.adminHelpNoticeWriteInsert(helpNoticeDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "check:" + check);
		
		
		
		mav.addObject("check", check);
		mav.addObject("helpNoticeDto", helpNoticeDto);
		
		mav.setViewName("help/adminHelpNoticeWriteOk");
			
	}

	@Override
	public void adminHelpNoticeList(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int boardSize=5;
		String pageNumber=request.getParameter("pageNumber");
		
		if(pageNumber==null) pageNumber="1";
		
		int currentPage=Integer.parseInt(pageNumber);
		int startRow=(currentPage-1)*boardSize+1;
		int endRow=currentPage*boardSize;
		
		int count=iAdminHelpDao.adminHelpNoticeCount();
		GoBookAspect.logger.info(GoBookAspect.logMsg+ "count:" + count);

		List<HelpNoticeDto> adminHelpNoticeListSelect=null;
		if(count > 0){
//			System.out.println("OK");
			HashMap<String, Integer> hMap=new HashMap<String, Integer>();
			hMap.put("startRow", startRow);
			hMap.put("endRow", endRow);
			adminHelpNoticeListSelect=iAdminHelpDao.adminHelpNoticeListSelect(hMap);
			GoBookAspect.logger.info(GoBookAspect.logMsg + adminHelpNoticeListSelect.size());
			
			
		}
		
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("boardSize", boardSize);
		mav.addObject("adminHelpNoticeListSelect", adminHelpNoticeListSelect);
		
		mav.setViewName("help/adminHelpNoticeList");
	}

	@Override
	public void adminHelpNoticeRead(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpnotice_num=Integer.parseInt(request.getParameter("helpnotice_num"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + "helpnotice_num:" + helpnotice_num +"\t"+ "pageNumber:"+ pageNumber);
		
		HelpNoticeDto helpNoticeDto=iAdminHelpDao.adminHelpNoticeRead(helpnotice_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "helpNoticeDto:" + helpNoticeDto);
		
		mav.addObject("helpNoticeDto", helpNoticeDto);
		mav.addObject("pageNumber", pageNumber);
		mav.setViewName("help/adminHelpNoticeRead");
		
	}

	@Override
	public void adminHelpNoticeDelete(ModelAndView mav) {
		System.out.println("OK2");
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpnotice_num=Integer.parseInt(request.getParameter("helpnotice_num"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + "helpnotice_num:" + helpnotice_num);
		
		int check=iAdminHelpDao.adminHelpNoticeDelete(helpnotice_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "check" + check);
		
		mav.addObject("check", check);
		
		mav.setViewName("help/adminHelpNoticeDelete");
		
	}

	@Override
	public void adminHelpNoticeUpdate(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		
		int helpnotice_num=Integer.parseInt(request.getParameter("helpnotice_num"));
		int pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		GoBookAspect.logger.info(GoBookAspect.logMsg + "helpnotice_num:" + helpnotice_num +"\t" + "pageNumber:" + pageNumber);
		
		HelpNoticeDto helpNoticeDto=iAdminHelpDao.adminHelpNoticeSelect(helpnotice_num);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "helpNoticeDto:" + helpNoticeDto);
		
		mav.addObject("helpNoticeDto", helpNoticeDto);
		mav.addObject("pageNumber", pageNumber);
		
		mav.setViewName("help/adminHelpNoticeUpdate");
	}

	@Override
	public void adminHelpNoticeUpdateOk(ModelAndView mav) {
		Map<String, Object> hmap=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) hmap.get("request");
		HelpNoticeDto helpNoticeDto=(HelpNoticeDto) hmap.get("helpNoticeDto");
		GoBookAspect.logger.info(GoBookAspect.logMsg +"helpNoticeDto:" + helpNoticeDto.getHelpnotice_subject());
		GoBookAspect.logger.info(GoBookAspect.logMsg +"helpNoticeDto:" + helpNoticeDto.getHelpnotice_num());
		GoBookAspect.logger.info(GoBookAspect.logMsg +"helpNoticeDto:" + helpNoticeDto.getHelpnotice_content());
		
		int check=iAdminHelpDao.adminHelpNoticeUpdateOk(helpNoticeDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg +"check:" + check);
		
		mav.addObject("helpNoticeDto", helpNoticeDto);
		mav.addObject("check", check);
		
		mav.setViewName("help/adminHelpNoticeUpdateOk");	
	}

}		




