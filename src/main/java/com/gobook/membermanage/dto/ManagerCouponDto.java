package com.gobook.membermanage.dto;

import java.util.Date;

public class ManagerCouponDto {
	private int mcoupon_num;			//관리자 쿠폰 고유 번호
	private String member_manager_id;		//관리자 아이디
	private String manager_coupon_name;		//쿠폰 이름
	private Date manager_coupon_period;	//쿠폰 사용기간
	private String manager_coupon_content;	//쿠폰 내용
	private int manager_coupon_discount;	//쿠폰 할인율(100이하이면 자동으로 퍼센트 계산 100이상이면 원으로 계산)

	public int getMcoupon_num() {
		return mcoupon_num;
	}
	public void setMcoupon_num(int mcoupon_num) {
		this.mcoupon_num = mcoupon_num;
	}
	public String getMember_manager_id() {
		return member_manager_id;
	}
	public void setMember_manager_id(String member_manager_id) {
		this.member_manager_id = member_manager_id;
	}
	public String getManager_coupon_name() {
		return manager_coupon_name;
	}
	public void setManager_coupon_name(String manager_coupon_name) {
		this.manager_coupon_name = manager_coupon_name;
	}

	public Date getManager_coupon_period() {
		return manager_coupon_period;
	}
	public void setManager_coupon_period(Date manager_coupon_period) {
		this.manager_coupon_period = manager_coupon_period;
	}
	public String getManager_coupon_content() {
		return manager_coupon_content;
	}
	public void setManager_coupon_content(String manager_coupon_content) {
		this.manager_coupon_content = manager_coupon_content;
	}
	public int getManager_coupon_discount() {
		return manager_coupon_discount;
	}
	public void setManager_coupon_discount(int manager_coupon_discount) {
		this.manager_coupon_discount = manager_coupon_discount;
	}
}
