package com.kosateam2.chicken.dto;

import java.util.Date;

public class ChickenMemberAndOrder {
	//ChickenMember
	private String mid;
	private String mname;
	private String mpassword;
	private String mphonenumber;
	private int mlevel;
	private String lname;
	private float discount;
	
	//order
	private int oid;
	private int did;
	private int price;
	private double lat;
	private double lng;
	private Date datetime;
	private int ostatus;
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
	public int getMlevel() {
		return mlevel;
	}
	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
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
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public Date getDate() {
		return datetime;
	}
	public void setDate(Date date) {
		this.datetime = date;
	}
	public int getOstatus() {
		return ostatus;
	}
	public void setOstatus(int ostatus) {
		this.ostatus = ostatus;
	}

	
	
}
