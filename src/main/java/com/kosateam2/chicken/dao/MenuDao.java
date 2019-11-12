package com.kosateam2.chicken.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.dto.Drone;
import com.kosateam2.chicken.dto.ItemMember;
import com.kosateam2.chicken.dto.Order;

@Component
public class MenuDao {
	private static final Logger logger = LoggerFactory.getLogger(MenuDao.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ChickenMenu> selectMenu() {
		List<ChickenMenu> menuList = sqlSessionTemplate.selectList("menu.selectMenu");
		return menuList;
	}

	public int getOid() {
		int orderId = sqlSessionTemplate.selectOne("menu.getOid");
		return orderId;
	}

	public void insertItems(ArrayList<ItemMember> itemList) {
		for(int i=0;i<itemList.size();i+=1) {
			sqlSessionTemplate.insert("menu.insertNowMenu", itemList.get(i));
		}
	}
	public void insertOrder(Order order) {
		sqlSessionTemplate.insert("menu.insertNowOrder", order);
	}
	public int selectDrone() {
		List<Drone> droneList = sqlSessionTemplate.selectList("menu.selectDrone");
		return droneList.get(0).getDid();
	}

}
