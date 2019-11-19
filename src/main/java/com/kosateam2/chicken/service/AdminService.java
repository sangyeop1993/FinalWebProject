package com.kosateam2.chicken.service;

import java.util.List;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.AdminDao;
import com.kosateam2.chicken.dto.ChickenMemberAndOrder;
import com.kosateam2.chicken.dto.ItemMenusAndMenus;
import com.kosateam2.chicken.dto.Order;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;

	public List<ChickenMemberAndOrder> orderList(int startRowNo,int endRowNo) {
		List<ChickenMemberAndOrder> list= adminDao.orderList(startRowNo, endRowNo);
		return list;
	}

	public ChickenMemberAndOrder searchOrder(int oid) {
		ChickenMemberAndOrder chickenMemberAndOrder=adminDao.selectOneByOid(oid);
		return chickenMemberAndOrder;
	}

	public List<ItemMenusAndMenus> orderItems(int oid) {
		List<ItemMenusAndMenus> list=adminDao.selectOrderItems(oid);
		return list;
	}

	public boolean updateOrderStatus(Order order) {
		boolean result=adminDao.updateOrderState(order);
		return result;
	}
	
	public int getTotalRowNum() {
		int num = adminDao.selectTotalRowNum();
		return num;
	}

	public void sendMqtt(Order order) {
		WebSocketTest socket=new WebSocketTest();
		JSONObject json=new JSONObject();
		json.put("oid", order.getOid());
		json.put("lat", order.getLat());
		json.put("lng", order.getLng());
		json.put("datetime", order.getDatetime());
		String message=json.toString();
		socket.sendMessage("/drone/chicken/delivery/request", message);
		socket.destroy();
	}

	
	
	
}
