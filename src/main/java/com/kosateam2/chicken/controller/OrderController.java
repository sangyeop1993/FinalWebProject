package com.kosateam2.chicken.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMember;
import com.kosateam2.chicken.dto.ChickenMemberAndOrder;
import com.kosateam2.chicken.dto.ChickenMenu;
import com.kosateam2.chicken.dto.Drone;
import com.kosateam2.chicken.dto.ItemMember;
import com.kosateam2.chicken.dto.Order;
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
	
	@RequestMapping("/fix")
	public void fix(double lat, double lng, HttpSession sess) {
		
	}
	
	@RequestMapping("/payment")
	public String payment(HttpSession sess, String nowLat, String nowLng) {
		ArrayList<String[]> selectedList = (ArrayList<String[]>) sess.getAttribute("selectedMenu");
		int orderId;
		if(sess.getAttribute("orderId")==null) {
			orderId = service.getOid();
			sess.setAttribute("orderId", orderId);
			ArrayList<ItemMember> itemList = new ArrayList<>();
			
			Drone drone = service.getDid();
			sess.setAttribute("drone", drone);
			
			logger.debug("########################"+drone.getDname());
			ChickenMember member = (ChickenMember)sess.getAttribute("member");
			Order order = new Order();
			order.setOid(orderId);
			order.setMid(member.getMid());
			order.setDid(drone.getDid());
			order.setPrice(0);
			order.setLat(Double.parseDouble(nowLat));
			order.setLng(Double.parseDouble(nowLng));
			order.setOstatus(0);
			
			service.nowOrder(order);
			
			for(int i=0;i<selectedList.size();i+=1) {
				ItemMember itemMember = new ItemMember();
				itemMember.setOid(orderId);
				int menuId_1 = Integer.parseInt(selectedList.get(i)[3]);
				int menuId;
				if(menuId_1<=4) menuId = menuId_1+1001;
				else if(menuId_1<=7) menuId = menuId_1+1996;
				else menuId = menuId_1+2993;
				itemMember.setMenuId(menuId);
				itemMember.setAmount(Integer.parseInt(selectedList.get(i)[2]));
				itemList.add(itemMember);
			}
			service.nowMenu(itemList);
			service.pubOrderId(orderId, nowLat, nowLng);
		} else {
			orderId = (int)sess.getAttribute("orderId");
		}
		logger.debug("######################"+orderId+"##############");
		return "/main";
	}
	
	@RequestMapping("/adminPage")
	public String requestList(HttpServletRequest request,HttpServletResponse response, Model model) {
		List<ChickenMemberAndOrder> list=service.requestChickenOrder();
		System.out.println(list.get(0).getDatetime());
		model.addAttribute("list",list);
		return "admin";
	}
	
	@RequestMapping("/orderEnd")
	public void orderEnd(HttpSession sess, HttpServletResponse response) throws IOException {
		PrintWriter pw = response.getWriter();
		logger.debug("byebye orderId");
		sess.removeAttribute("orderId");
		JSONObject object = new JSONObject();
		object.put("success", "true");
		pw.print(object.toString());
		pw.flush();
		pw.close();
	}
}
