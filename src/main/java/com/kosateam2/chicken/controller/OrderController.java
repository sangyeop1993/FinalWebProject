package com.kosateam2.chicken.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	//menuó��
	@RequestMapping("/select")
	public String select() {
		
		return "";
	}
	
}
