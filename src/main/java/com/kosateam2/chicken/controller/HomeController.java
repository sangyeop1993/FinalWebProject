package com.kosateam2.chicken.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMember;
import com.kosateam2.chicken.service.DroneService;

@Controller
public class HomeController {

	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	//SelectMenu
	@RequestMapping("/selectMenu")
	public String selectMenu(ChickenMember member, Model model) {
		model.addAttribute("member", member);
		return "selectMenu";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "droneMessageTest";
	}
	
	@RequestMapping("/endPage")
	public String endPage(HttpSession sess) {
		sess.removeAttribute("selectedMenu");
		sess.removeAttribute("orderCost");
		sess.removeAttribute("discountCost");
		sess.removeAttribute("finalCost");
		sess.removeAttribute("member");
		sess.removeAttribute("loginResult");
		return "endPage";
	}
}
