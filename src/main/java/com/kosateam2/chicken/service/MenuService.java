package com.kosateam2.chicken.service;

import java.util.ArrayList;
import java.util.List;

import org.eclipse.paho.client.mqttv3.MqttClient;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.MenuDao;
import com.kosateam2.chicken.dto.ChickenMemberAndOrder;
import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.dto.Drone;
import com.kosateam2.chicken.dto.ItemMember;
import com.kosateam2.chicken.dto.Order;

@Service
public class MenuService {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuService.class);
	
	public String mqttBrockerConnStr = "tcp://106.253.56.124:1882";
	public String pubTopic = "/chicken/order/pub";
	public String subTopic = "";
	public MqttClient client;
	
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
	public Drone getDid() {
		Drone drone = menuDao.selectDrone();
		return drone;
	}
	public void pubOrderId(int orderId, String nowLat, String nowLng) {
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("msgid", "ORDER");
	    jsonObject.put("orderId", orderId);
	    jsonObject.put("Lat", nowLat);
	    jsonObject.put("Lng", nowLng);
	    String json = jsonObject.toString();
		try {
			if(client != null && client.isConnected()) {
				client.disconnect();
				client.close();
			}
			client = new MqttClient(mqttBrockerConnStr, MqttClient.generateClientId(), null);
			client.connect();
			client.publish(pubTopic, json.getBytes(), 0, false);
		} catch (Exception e) {}
	}
	
	public List<ChickenMemberAndOrder> requestChickenOrder() {
		List<ChickenMemberAndOrder>list= menuDao.selectOrder();
		return list;
	}
	
}
