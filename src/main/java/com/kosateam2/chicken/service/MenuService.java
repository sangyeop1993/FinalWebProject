package com.kosateam2.chicken.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.MenuDao;
import com.kosateam2.chicken.dto.ChickenMenu;

@Service
public class MenuService {
	
	@Autowired
	MenuDao menuDao;
	
	public List<ChickenMenu> getChickenMenu() {
		List<ChickenMenu> menuList = menuDao.selectMenu();  
		return menuList;
	}
	

}
