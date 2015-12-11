package com.gobook.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.gobook.aop.GoBookAspect;
import com.gobook.member.dao.IMemberDao;
import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.ZipcodeDto;

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
			GoBookAspect.logger.info(GoBookAspect.logMsg + zipcode.size());
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
		GoBookAspect.logger.info(GoBookAspect.logMsg + check);
		
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
		GoBookAspect.logger.info(GoBookAspect.logMsg + check);
		
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
		
		String loginId=iMemberDao.memberLogin(id,password);
		GoBookAspect.logger.info(GoBookAspect.logMsg + loginId);
		
		if(loginId!=null&&loginId!=""){
			int deleteCouponValue = iMemberDao.memberDeleteCouponDate(loginId);
			GoBookAspect.logger.info(GoBookAspect.logMsg + "기간지난쿠폰 : " + deleteCouponValue);
			
			int deleteBasketValue = iMemberDao.memberDeleteBasketDate(loginId);
			GoBookAspect.logger.info(GoBookAspect.logMsg + "기간지난장바구니 : " + deleteBasketValue);
		}
		
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
}
