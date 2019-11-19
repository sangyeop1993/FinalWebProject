	package com.kosateam2.chicken.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosateam2.chicken.dto.ChickenMemberAndOrder;
import com.kosateam2.chicken.dto.ItemMenusAndMenus;
import com.kosateam2.chicken.dto.Order;
import com.kosateam2.chicken.service.AdminService;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@Autowired
	AdminService service;
	
	
	@RequestMapping("/requestList")
	public String admin(Model model, @RequestParam(defaultValue="1") int pageNo,HttpSession session) {
		
		//페이지당 행수
		int rowsPerPage = 10;			
		//이전,다음을 클릭했을 때 나오는 페이지 수 
		int pagesPerGroup = 5;
		//전체 게시물 수 
		int totalRowNum = service.getTotalRowNum();
		//전체 페이지 수
		int totalPageNum = totalRowNum/rowsPerPage;
		if(totalRowNum % rowsPerPage != 0) totalPageNum++;
		//전체 그룹 수 
		int totalGroupNum = totalPageNum / pagesPerGroup;
		if(totalPageNum % pagesPerGroup !=0) totalGroupNum++;
		
		//현재 페이지의 그룹번호
		int groupNo = (pageNo-1)/pagesPerGroup +1;
		//현재 그룹의 시작 페이지 번호
		int startPageNo = (groupNo-1)*pagesPerGroup + 1;
		//현재 그룹의 마지막 페이지 번호
		int endPageNo = startPageNo + pagesPerGroup - 1;
		if(groupNo == totalGroupNum) endPageNo = totalPageNum;
		//현재 페이지의 시작 행 번호
		int startRowNo = (pageNo-1)*rowsPerPage+1;
		//현재 페이지의 끝 행 번호
		int endRowNo = pageNo*rowsPerPage;
		if(pageNo == totalPageNum) endRowNo = totalRowNum;
		
		List<ChickenMemberAndOrder> list =service.orderList(startRowNo, endRowNo); 
		model.addAttribute("list",list);
		model.addAttribute("pagesPerGroup",pagesPerGroup);
		model.addAttribute("totalPageNum",totalPageNum);
		model.addAttribute("totalGroupNum",totalGroupNum);
		model.addAttribute("groupNo",groupNo);
		model.addAttribute("startPageNo",startPageNo);
		model.addAttribute("endPageNo",endPageNo);
		model.addAttribute("pageNo",pageNo);
		return "requestList";
	}
	
	@RequestMapping("/detailOrder")
	public String detailOrder(int oid, Model model) {
		ChickenMemberAndOrder member=service.searchOrder(oid);
		List<ItemMenusAndMenus> itemList=service.orderItems(oid);
		int totalWeight = 0;
		for(int i=0;i<itemList.size();i+=1) {
			totalWeight += itemList.get(i).getAmount()*itemList.get(i).getMenuWeight();
		}
		model.addAttribute("totalWeight", totalWeight);
		model.addAttribute("member",member);
		model.addAttribute("itemList",itemList);
		return "detailPage";
	}
	
	@RequestMapping("/returnList")
	public String returnList() {
		return "redirect:/requestList";
	}
	
	@RequestMapping("/commitOrder")
	public String commitOrder(Order order) throws ParseException {
		
		boolean result=service.updateOrderStatus(order);
		if(order.getOstatus()==1) {
			service.sendMqtt(order);
		}
		
		
		return "redirect:/requestList";
	}
}
