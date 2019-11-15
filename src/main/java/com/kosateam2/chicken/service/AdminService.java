package com.kosateam2.chicken.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosateam2.chicken.dao.AdminDao;
import com.kosateam2.chicken.dto.ChickenMemberAndOrder;
import com.kosateam2.chicken.dto.ItemMenusAndMenus;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao adminDao;

	public List<ChickenMemberAndOrder> orderList() {
		List<ChickenMemberAndOrder> list= adminDao.orderList();
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
	
	
	
}
