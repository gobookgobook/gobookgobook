package com.gobook.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.bookmanage.dto.BookDto;
import com.gobook.event.dto.EventDto;
import com.gobook.member.dao.IMemberDao;
import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.ZipcodeDto;
import com.gobook.userorder.dto.UserOrderDto;

/**
 * @클래스이름 : MemberService
 * @날짜 : 2015. 12. 8.
 * @개발자 : 강주혁
 * @설명 : 회원관리 Service
 */
@Component
public class MemberService implements IMemberService {

	@Autowired
	private IMemberDao iMemberDao;

	/**
	 * @함수이름 : zipcode
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 우편번호
	 */
	@Override
	public void zipcode(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String dong=request.getParameter("dong");
		
		if(dong !=null && dong !=""){
			GoBookAspect.logger.info(GoBookAspect.logMsg + dong);
			
			List<ZipcodeDto> zipcode=iMemberDao.zipcode(dong);
			GoBookAspect.logger.info(GoBookAspect.logMsg + "zipcode" + zipcode.size());
			mav.addObject("zipcode", zipcode);
		}
		
		mav.setViewName("member/zipcode");
	}

	/**
	 * @함수이름 : memberIdCheck
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : ID 중복체크
	 */
	@Override
	public void memberIdCheck(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String id=request.getParameter("member_id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + id);
		
		int check=iMemberDao.memberIdCheck(id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "check:" + check);
		
		if(id.equals("")){
			check=-1;
		}
		
		mav.addObject("check", check);
		mav.addObject("id", id);
		
		mav.setViewName("member/idCheck");
	}

	/**
	 * @함수이름 : memberInsert
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원가입
	 */
	@Override
	public void memberInsert(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		MemberDto memberDto=(MemberDto) map.get("memberDto");
		memberDto.setMember_point(0);
		
		//System.out.println(memberDto.getMember_birth());
		
		int check=iMemberDao.memberInsert(memberDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "insert" +check);
		
		mav.addObject("check", check);
		mav.setViewName("member/registerOk");
		
	}

	/**
	 * @함수이름 : memberLogin
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원로그인
	 */
	@Override
	public void memberLogin(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String id=request.getParameter("member_id");
		String password=request.getParameter("member_password");
		GoBookAspect.logger.info(GoBookAspect.logMsg + id + "\t" + password);
		
		MemberDto userMember=iMemberDao.memberLogin(id,password);
		GoBookAspect.logger.info(GoBookAspect.logMsg + userMember);
		
		String loginId=null;
		String deleteIdCheck=null;
		int deleteId=0;
		
		if(userMember!=null){
			deleteIdCheck = userMember.getMember_zipcode();
			GoBookAspect.logger.info(GoBookAspect.logMsg + deleteIdCheck);
			
			if(deleteIdCheck.equals("0")){
				deleteId=1;
			}
			
			int deleteCouponValue = iMemberDao.memberDeleteCouponDate(userMember.getMember_id());
			GoBookAspect.logger.info(GoBookAspect.logMsg + "기간지난쿠폰 : " + deleteCouponValue);
			
			int deleteBasketValue = iMemberDao.memberDeleteBasketDate(userMember.getMember_id());
			GoBookAspect.logger.info(GoBookAspect.logMsg + "기간지난장바구니 : " + deleteBasketValue);
			
			loginId=userMember.getMember_id();
		}
		
		mav.addObject("deleteId", deleteId);
		mav.addObject("loginId", loginId);
		
		mav.setViewName("member/loginOk");
	}

	/**
	 * @함수이름 : memberDeleteOk
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 회원탈퇴
	 */
	@Override
	public void memberDeleteOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String id=request.getParameter("member_id");
		String password=request.getParameter("member_password");
		GoBookAspect.logger.info(GoBookAspect.logMsg + "id:" + id + "," + "password:" + password);
		
		int check=iMemberDao.memberDelete(id, password);
		GoBookAspect.logger.info(GoBookAspect.logMsg + "check:" + check);
		
		mav.addObject("check", check);
		mav.setViewName("member/deleteOk");
	}

	/**
	 * @함수이름 : memberUpdate
	 * @작성일 : 2015. 12. 8.
	 * @개발자 : 강주혁
	 * @설명 : 사용자 정보 가져오기
	 */
	@Override
	public void memberUpdate(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		GoBookAspect.logger.info(GoBookAspect.logMsg + id);
		
		MemberDto memberDto=iMemberDao.memberSelect(id);
		GoBookAspect.logger.info(GoBookAspect.logMsg + memberDto);
		
		mav.addObject("memberDto", memberDto);
		
		mav.setViewName("member/update");
	}

	/**
	 * @함수이름 : memberUpdateOk
	 * @작성일 : 2015. 12. 9.
	 * @개발자 : 강주혁
	 * @설명 : 회원정보 수정
	 */
	@Override
	public void memberUpdateOk(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		MemberDto memberDto=(MemberDto) map.get("memberDto");
		GoBookAspect.logger.info(GoBookAspect.logMsg + memberDto);
		
		int check=iMemberDao.memberUpdate(memberDto);
		GoBookAspect.logger.info(GoBookAspect.logMsg + check);
		
		mav.addObject("check", check);
		
		mav.setViewName("member/updateOk");
	}

	/**
	 * @함수이름 : goBookMain
	 * @작성일 : 2015. 12. 12.
	 * @개발자 : 성기훈
	 * @설명 : 메인페이지(사용자, 관리자 구분)
	 * @수정 : 오주석:베스트 셀러 추가
	 * @수정 : 오주석:이벤트 추카
	 */
	@Override
	public void goBookMain(ModelAndView mav) {
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session=request.getSession();
		String id=(String) session.getAttribute("id");
		
		mav.addObject("id", id);
		List<BookDto> bestSeller=iMemberDao.userBookBestSeller();
		GoBookAspect.logger.info(GoBookAspect.logMsg + bestSeller.size());
		
		List<EventDto> eventeList=iMemberDao.eventListSelect();
		GoBookAspect.logger.info(GoBookAspect.logMsg + eventeList.size());
		
		List<BookDto> newBook=iMemberDao.newBookSelect();
		GoBookAspect.logger.info(GoBookAspect.logMsg + newBook.size());
		
		mav.addObject("bestSeller", bestSeller);
		mav.addObject("eventeList", eventeList);
		mav.addObject("newBook", newBook);
		
		try{
			if(id.equals("admin")) mav.setViewName("member/adminMain");
			else mav.setViewName("member/goBookMain");
		}catch(Exception e){}
	}

}
