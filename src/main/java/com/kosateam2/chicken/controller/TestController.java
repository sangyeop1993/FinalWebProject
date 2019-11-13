package com.kosateam2.chicken.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/test1")
	public String main() {	
		return "test1";
	}
	
	@RequestMapping("/requestList")
	public String requestList() {
		return "requestList";
	}

}