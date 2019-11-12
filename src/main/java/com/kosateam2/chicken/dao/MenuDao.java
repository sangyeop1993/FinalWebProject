package com.kosateam2.chicken.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.dto.Drone;
import com.kosateam2.chicken.dto.ItemMember;

@Component
public class MenuDao {
	
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

	public void insert(ArrayList<ItemMember> itemList) {
		for(int i=0;i<itemList.size();i+=1) {
			sqlSessionTemplate.insert("menu.insertNowMenu", itemList.get(i));
		}
	}

	public int selectDrone() {
		List<Drone> droneList = sqlSessionTemplate.selectList("menu.selectDrone");
		return droneList.get(0).getDid();
	}

}
