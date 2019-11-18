package com.kosateam2.chicken.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMemberAndOrder;
import com.kosateam2.chicken.dto.ItemMenusAndMenus;
import com.kosateam2.chicken.dto.Order;
import com.kosateam2.chicken.service.AdminService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	AdminService service;
	
	
	@RequestMapping("/requestList")
	public String admin(Model model) {
		List<ChickenMemberAndOrder> list =service.orderList(); 
		model.addAttribute("list",list);
		return "requestList";
	}
	
	@RequestMapping("/detailOrder")
	public String detailOrder(int oid, Model model) {
		ChickenMemberAndOrder member=service.searchOrder(oid);
		List<ItemMenusAndMenus> itemList=service.orderItems(oid);
		int totalWeight = 0;
		for(int i=0;i<itemList.size();i+=1) {
			totalWeight += itemList.get(i).getAmount()*itemList.get(i).getMenuWeight();
		}
		model.addAttribute("totalWeight", totalWeight);
		model.addAttribute("member",member);
		model.addAttribute("itemList",itemList);
		return "detailPage";
	}
	
	@RequestMapping("/returnList")
	public String returnList() {
		return "redirect:/requestList";
	}
	
	@RequestMapping("/commitOrder")
	public String commitOrder(Order order) throws ParseException {
		
		boolean result=service.updateOrderStatus(order);
		if(order.getOstatus()==1) {
			service.sendMqtt(order);
		}
		
		
		return "redirect:/requestList";
	}
}
