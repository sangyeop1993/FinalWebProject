package com.kosateam2.chicken.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	//�ӽ� selectMenu ���ӹ�ư
	@RequestMapping("/selectMenu")
	public String selectMenu() {
		return "selectMenu";
	}
}
