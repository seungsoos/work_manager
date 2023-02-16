package com.project.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.portfolio.dto.CompanyWorkTypeDTO;
import com.project.portfolio.service.CompanyWorkCalendarService;
import com.project.portfolio.service.CompanyWorkTypeApproverService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/worktypeapproverctr")
@Log4j
public class CompanyWorkTypeApproverController {
	
	@Autowired
	CompanyWorkTypeApproverService service;
	
	@Autowired
	CompanyWorkCalendarService calendarService;

	@GetMapping(value = "/approver.do")
	public String approver(HttpServletRequest request, Model model) {
		log.info("---근태결재 페이지(결재전)---");
		
		HttpSession session =request.getSession();	
		String emp_id = (String) session.getAttribute("emp_id");
		System.out.println(emp_id);
		String app_status = "결재대기";
		
		List<CompanyWorkTypeDTO> workTypeList = service.listPage(emp_id, app_status);
		model.addAttribute("workTypeList",workTypeList);
		
		return "workTypeApprover/workTypeApprover";
	}
	
	@GetMapping("/approverAllow.do")
	public String approverAllow(HttpServletRequest request) {
		log.info("---근태 신청 승인---");
		String emp_id = request.getParameter("emp_id");
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		String app_status = "결재완료";
		
		service.approverAllow(emp_id, app_status);
		
		System.out.println("결재대상자 아이디값 확인 : " + emp_id);
		System.out.println("결재대상자 bno값 확인 : " + bno);
		
		calendarService.workTypeCalendarInsert(emp_id, bno);
		
		System.out.println("---캘린더 추가 성공---");
		
		return "forward:/worktypeapproverctr/approver.do";
	}
	
	@GetMapping("/approverDisallow.do")
	public String approverDisallow(HttpServletRequest request) {
		log.info("---근태 신청 반려---");
		String emp_id = request.getParameter("emp_id");
		System.out.println(emp_id);
		
		String app_status = "결재반려";
		
		service.approverDisallow(emp_id, app_status);
		
		return "forward:/worktypeapproverctr/approver.do";
	}
	
}
