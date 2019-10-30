package com.kosateam2.chicken.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMember;
import com.kosateam2.chicken.service.LoginService;

@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	LoginService service;
	
	@RequestMapping("/main")
	public String main(HttpSession sess, Model model) {
		model.addAttribute("member_model", sess.getAttribute("member"));
		return "/main";
	}
	
	@RequestMapping("/deleteMember")
	public String deleteMember(HttpSession sess, String mid) {
		sess.removeAttribute("member");
		sess.removeAttribute("loginResult");
		service.deleteMember(mid);
		return "redirect:/";
	}
}
