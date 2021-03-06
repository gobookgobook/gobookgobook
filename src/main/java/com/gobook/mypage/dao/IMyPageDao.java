package com.gobook.mypage.dao;

import java.util.List;

//import com.gobook.help.dto.HelpPvPDto;
import com.gobook.member.dto.UserCouponDto;
import com.gobook.userorder.dto.UserOrderDto;

public interface IMyPageDao {
	public List<UserOrderDto> myPageOrderListSelect(String member_id);
	public int myPageOrderCount(String member_id);
	public List<UserOrderDto> myPageHistoryListSelect(int startRow, int endRow, String member_id);
	public List<UserCouponDto> myPageCouponSelect(String member_id);
	public int myPagePointSelect(String member_id);
/*	public List<HelpPvPDto> myPagePvPListSelect(String member_id);
	public HelpPvPDto myPagePvPRead(int helppvp_num);*/
}
