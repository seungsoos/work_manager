package com.project.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.portfolio.dto.CompanyTimeCheckDTO;
import com.project.portfolio.service.CompanyTimeCheckService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/timecheckctr")
@Log4j
public class CompanyTimeCheckController{

	@Autowired
	CompanyTimeCheckService service;
	
	@Autowired
	CompanyTimeCheckDTO dto;
	
	@GetMapping(value = "/timeCheck.do")
	public String timeCheck(HttpServletRequest request,
							@RequestParam("num") int num,
							Model model) {
		log.info("---TimeCheck 근무시간 확인---");
		
		System.out.println("num 값 : " + num);
		
		String emp_id = request.getParameter("emp_id");
		String emp_name = request.getParameter("emp_name");
		
		System.out.println(emp_id);
		System.out.println(emp_name);
		
		
		int count = service.count(emp_id);
		System.out.println("토탈 : " + count);
		
		int postNum = 10;
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		int displayPost = (num - 1) * postNum;
		int pageNum_cnt = 10;
		
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		 
		if(endPageNum > endPageNum_tmp) {
		 endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		
		List<CompanyTimeCheckDTO> list = service.listPage(emp_id,displayPost, postNum);
		
		model.addAttribute("list",list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("check", num);
		model.addAttribute("emp_id",emp_id);
		model.addAttribute("emp_name",emp_name);
		model.addAttribute("divide","전체");
		
		return "timeCheck/workTimeCheck";
	}
	
	@GetMapping("/timeSelectCheck.do")
	public String timeSelectCheck(HttpServletRequest request, String selectTest,
			@RequestParam("num") int num, Model model) {
		log.info("---월별 근무현황 선택---");
		String emp_id = request.getParameter("emp_id");
		String emp_name = request.getParameter("emp_name");
		String select = request.getParameter("select");
		
		System.out.println("아이디 : " +  emp_id);
		System.out.println("이름 : " +  emp_name);
		System.out.println("월 : " +  select);
		
		int count = service.countMonth(emp_id, select);
		System.out.println("토탈 : " + count);
		
		int postNum = 10;
		int pageNum = (int)Math.ceil((double)count/postNum);
		
		int displayPost = (num - 1) * postNum;
		int pageNum_cnt = 10;
		
		int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_cnt) * pageNum_cnt);
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		
		int endPageNum_tmp = (int)(Math.ceil((double)count / (double)pageNum_cnt));
		 
		if(endPageNum > endPageNum_tmp) {
		 endPageNum = endPageNum_tmp;
		}
		
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;
		
		
		List<CompanyTimeCheckDTO> list = service.timeSelectCheck(select, emp_id,displayPost, postNum);
		System.out.println(list);
		
		model.addAttribute("list",list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("check", num);
		model.addAttribute("emp_id",emp_id);
		model.addAttribute("emp_name",emp_name);
		model.addAttribute("select",select);
		model.addAttribute("divide","월별");
		
		return "timeCheck/workTimeCheck";
	}
	
	
}
