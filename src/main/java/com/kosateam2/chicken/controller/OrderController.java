package com.kosateam2.chicken.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.service.MenuService;

@Controller
public class OrderController {
	private static final Logger log = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	MenuService service;
	
	//menu
	@RequestMapping("/select")
	public String select(Model model) {
		model.addAttribute("menu", service.getChickenMenu());
		return "redirect:selectMenu";
	}
}
