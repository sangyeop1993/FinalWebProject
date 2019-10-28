package com.kosateam2.chicken.dto;

public class ChickenMember {
	private String mid;
	private String mname;
	private String mpassword;
	private String mphonenumber;
	private String lname;
	private float discount;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpassword() {
		return mpassword;
	}
	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}
	public String getMphonenumber() {
		return mphonenumber;
	}
	public void setMphonenumber(String mphonenumber) {
		this.mphonenumber = mphonenumber;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
}
