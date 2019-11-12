package com.kosateam2.chicken.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.MenuDao;
import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.dto.ItemMember;

@Service
public class MenuService {
	
	@Autowired
	MenuDao menuDao;
	public List<ChickenMenu> getChickenMenu() {
		List<ChickenMenu> menuList = menuDao.selectMenu();  
		return menuList;
	}
	public int getOid() {
		int orderId = menuDao.getOid();
		return orderId;
	}
	public void nowMenu(ArrayList<ItemMember> itemList) {
		menuDao.insert(itemList);
	}
	public int getDid() {
		int droneId = menuDao.selectDrone();
		return droneId;
	}
	

}
