package com.gobook.mypage.dao;

import java.util.List;

import com.gobook.member.dto.UserCouponDto;
import com.gobook.userorder.dto.UserOrderDto;

public interface IMyPageDao {
	public List<UserOrderDto> myPageOrderListSelect(String member_id);
	public int myPageOrderCount();
	public List<UserOrderDto> myPageHistoryListSelect(int startRow, int endRow, String member_id);
	public List<UserCouponDto> myPageCouponSelect(String member_id);
}
