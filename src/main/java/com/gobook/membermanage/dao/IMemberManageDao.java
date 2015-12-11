package com.gobook.membermanage.dao;

import java.util.HashMap;
import java.util.List;

import com.gobook.member.dto.MemberDto;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.member.dto.ZipcodeDto;
import com.gobook.membermanage.dto.ManagerCouponDto;

public interface IMemberManageDao {

	public MemberDto memberManageSelect(String member_id);
	public List<ZipcodeDto> managerZipcode(String dong);
	public int memberManageUpdate(MemberDto memberDto);
	public int memberManageCouponInsert(ManagerCouponDto managerCouponDto);
	public List<ManagerCouponDto> memberManageCouponListSelect();
	public ManagerCouponDto memberManageCouponRead(int mcoupon_num);
	public List<UserCouponDto> userCouponSelect(int mcoupon_num);
	public List<MemberDto> memberIdList();
	public int memberManageCouponGiveUserInsert(String id, int mcoupon_num);

}
