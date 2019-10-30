package com.kosateam2.chicken.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosateam2.chicken.dto.ChickenMember;
import com.kosateam2.chicken.service.LoginService;

@Controller
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private LoginService service;
	
	@PostMapping("/login")
	public String login(String mid, String mpassword, HttpSession session) {
		String loginResult;
		ChickenMember member = service.logincheck(mid, mpassword);
		if(member==null) {
			loginResult="fail";
		} else if(!member.getMpassword().equals(mpassword)) {
			loginResult="fail";
		} else if(member.getMid().equals(mid)) {
			loginResult="success";
			session.setAttribute("member", member);
		} else {
			loginResult="fail";
		}
		session.setAttribute("loginResult", loginResult);
		return "redirect:/";
	}
	
	@RequestMapping("/checkMid")
	public void checkMid(String mid, HttpServletResponse response) throws Exception{
		boolean result = service.checkMid(mid);
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result",result);
		pw.print(jsonObject+"");
		pw.flush();
		pw.close();
	}

	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginResult");
		session.removeAttribute("member");
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public String joinForm() {
		return "/joinForm";
	}
	
	@PostMapping("/join")
	public String join(ChickenMember member) {
		service.join(member);
		return "redirect:/";
	}
}
