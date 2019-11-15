package com.kosateam2.chicken.dto;

public class ItemMenusAndMenus {
	//ItemMenus
	private int oid;
	private int menuId;
	private int amount;
	//ChickenMenu
	private String menuName;
	private int menuPrice;
	private int menuWeight;
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public int getMenuWeight() {
		return menuWeight;
	}
	public void setMenuWeight(int menuWeight) {
		this.menuWeight = menuWeight;
	}
}
