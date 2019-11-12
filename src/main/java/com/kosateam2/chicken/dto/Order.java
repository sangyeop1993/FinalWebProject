package com.kosateam2.chicken.dto;

import java.util.Date;

public class Order {
	private int oid;
	private String mid;
	private int did;
	private int price;
	private double lat;
	private double lng;
	private Date date;
	private int ostatus;
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public void setLat(int lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(int lng) {
		this.lng = lng;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public int getOstatus() {
		return ostatus;
	}
	public void setOstatus(int ostatus) {
		this.ostatus = ostatus;
	}

}
