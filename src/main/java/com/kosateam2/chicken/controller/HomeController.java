package com.kosateam2.chicken.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMember;

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
}
