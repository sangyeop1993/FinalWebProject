package com.kosateam2.chicken.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMember;

@Controller
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	
	
	//menu
	@RequestMapping("/select")
	public String select(String chickenName, Model model, ChickenMember member) {
		model.addAttribute("member", member);
		log.info("URL 비동기테스트");
		log.info("parameter Test: " + chickenName);
		return "redirect:selectMenu";
	}
}
