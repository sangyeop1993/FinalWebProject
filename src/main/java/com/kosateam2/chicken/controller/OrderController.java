package com.kosateam2.chicken.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.service.MenuService;

@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	MenuService service;
	
	//menu
	@RequestMapping("/order")
	public String order(Model model) {
		List<ChickenMenu> list = service.getChickenMenu();
		model.addAttribute("menus", list);
		return "orderMenu";
	}
	
	@RequestMapping("/finalOrder")
	public String finalOrder(HttpSession sess, String arr) {
		JSONArray jsonArray = new JSONArray(arr);
		List<ChickenMenu> list = service.getChickenMenu();
		List<String[]> selectedList = new ArrayList<>();
		for(int i=0;i<jsonArray.length();i+=1) {
			if(jsonArray.getInt(i) != 0) {
				String[] strarr = {list.get(i).getMenuName(), list.get(i).getMenuPrice()+"", jsonArray.getInt(i)+""};
				selectedList.add(strarr);
			}
		}
		sess.setAttribute("selectedMenu", selectedList);
		return "finalOrder";
	}
}
