package com.kosateam2.chicken.service;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.MenuDao;
import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.dto.ItemMember;
import com.kosateam2.chicken.dto.Order;

@Service
public class MenuService {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuService.class);
	
	
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
	public void nowOrder(Order order) {
		menuDao.insertOrder(order);
	}
	public void nowMenu(ArrayList<ItemMember> itemList) {
		menuDao.insertItems(itemList);
	}
	public int getDid() {
		int droneId = menuDao.selectDrone();
		return droneId;
	}
	public void pubOrderId(int orderId) {
		DroneService droneService = new DroneService();
		
	}
	
	

}
