package com.kosateam2.chicken.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.kosateam2.chicken.dto.ChickenMenu;

@Component
public class MenuDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<ChickenMenu> selectMenu() {
		List<ChickenMenu> menuList = sqlSessionTemplate.selectList("menu.selectMenu");
		return menuList;
	}

}
