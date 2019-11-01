package com.kosateam2.chicken.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMember;
import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.dto.ItemMember;
import com.kosateam2.chicken.service.MenuService;

@Controller
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
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
		String[] array = arr.split(",");
		List<ChickenMenu> list = service.getChickenMenu();
		List<String[]> selectedList = new ArrayList<>();
		int S = 0;
		for(int i=0;i<array.length;i+=1) {
			if(!array[i].equals("0")) {
				String[] strarr = {list.get(i).getMenuName(), list.get(i).getMenuPrice()+"", array[i], i+""};
				S += list.get(i).getMenuPrice()*Integer.parseInt(array[i]);
				selectedList.add(strarr);
			}
		}
		ChickenMember member = (ChickenMember)sess.getAttribute("member");
		int S_1 = (int)(S*member.getDiscount());
		int S_2 = S-S_1;
		sess.setAttribute("selectedMenu", selectedList);
		sess.setAttribute("orderCost", S);
		sess.setAttribute("discountCost", S_1);
		sess.setAttribute("finalCost", S_2);
		return "/finalOrder";
	}
	
	@RequestMapping("/payment")
	public String payment(HttpSession sess) {
		ArrayList<String[]> selectedList = (ArrayList<String[]>) sess.getAttribute("selectedMenu");
		int orderId = service.getOid();
		ArrayList<ItemMember> itemList = new ArrayList<>();
		
		for(int i=0;i<selectedList.size();i+=1) {
			ItemMember itemMember = new ItemMember();
			itemMember.setOid(orderId);
			itemMember.setMenuId(Integer.parseInt(selectedList.get(i)[3]));
			itemMember.setAmount(Integer.parseInt(selectedList.get(i)[2]));
			itemList.add(itemMember);
		}
		service.nowMenu(itemList);
		return "/main";
	}
}
