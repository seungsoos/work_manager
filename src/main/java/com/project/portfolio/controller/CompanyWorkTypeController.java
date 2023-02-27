package com.project.portfolio.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyWorkTypeDTO;
import com.project.portfolio.service.CompanyWorkTypeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/worktypectr")
@Log4j
public class CompanyWorkTypeController {

	@Autowired
	CompanyWorkTypeService service;
	
	@Autowired
	CompanyWorkTypeDTO dto;
	
	@RequestMapping(value = "/workType.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String workType() {
		log.info("---근태신청 페이지---");
		
		return "workType/workType";
	}
	
	@GetMapping(value = "/workTypeWindow.do")
	public String workTypeWindow() {
		log.info("---결재자 지정 윈도우 오픈---");
		
		return "workType/workTypeSearch";
	}
	
	@ResponseBody
	@PostMapping(value = "/workTypeApprover.do")
	public List<CompanyLoginDTO> workTypeApprover(@RequestBody HashMap<String, String> hashMap,
													Model model) {
		log.info("---결재자 지정---");
		String emp_name = hashMap.get("emp_name");
		System.out.println(emp_name);
		
		List<CompanyLoginDTO> result = service.approverSearch(emp_name);
		model.addAttribute("result",result);
		
		System.out.println(result);
		
		return result;
	}
	
	@PostMapping(value = "/workTypeApproverSave.do")
	public String workTypeApproverSelect(HttpServletRequest request,
										@RequestParam("work_date_start") Date work_date_start,
										@RequestParam("work_date_end") Date work_date_end,
										Model model) {
		log.info("---결재요청---");
		String work_type = request.getParameter("work_type");
		String work_content = request.getParameter("work_content");
		String approver = request.getParameter("approver_emp_id");
		
		String[] str = approver.split("/");
		String approver_emp_id = str[3].toString();
		
		HttpSession session =request.getSession();
		CompanyLoginDTO logindto = (CompanyLoginDTO) session.getAttribute("employeeLogin");
		
		String emp_id = logindto.getEmp_id();
		String emp_department = logindto.getEmp_department();
		String emp_rank = logindto.getEmp_rank();
		String emp_name = logindto.getEmp_name();
		
		dto.setEmp_id(emp_id);
		dto.setEmp_department(emp_department);
		dto.setEmp_rank(emp_rank);
		dto.setEmp_name(emp_name);	
		dto.setWork_date_start(work_date_start);
		dto.setWork_date_end(work_date_end);
		dto.setWork_type(work_type);
		dto.setWork_content(work_content);
		dto.setApprover_emp_id(approver_emp_id);
		
		service.approverRequest(dto);
		System.out.println("---근태신청완료---");
		return "forward:/worktypectr/workTypeStatus.do?num=1";
	}
	//----------------------------근태신청현황----------------------------
	
	@RequestMapping(value = "/workTypeStatus.do", 
					method = {RequestMethod.GET,RequestMethod.POST})
	public String workTypeStatus(HttpServletRequest request,
						Model model, @RequestParam("num") int num) {
		log.info("---근태신청현황---");
		
		HttpSession session = request.getSession();
		CompanyLoginDTO employeeLogin = (CompanyLoginDTO)session.getAttribute("employeeLogin");
		String emp_department = employeeLogin.getEmp_department();
		System.out.println(emp_department);
		
		int count;
		if(emp_department.equals("관리자")) {
			count = service.countAdmin();
		}else {
			count = service.count(emp_department);
		}
		
		   
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
		 List<CompanyWorkTypeDTO> workTypeList;
			if(emp_department.equals("관리자")) {
				workTypeList = service.workTypeStatusAdmin(displayPost, postNum);
			}else {
				 workTypeList = service.workTypeStatus(emp_department,displayPost, postNum);
			}
		 
		System.out.println(workTypeList);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("select", num);
		model.addAttribute("workTypeList",workTypeList);
		model.addAttribute("pageNum", pageNum);
		return "workType/workTypeStatus";
	}
	
	
	
	
	
	
	
	
	
	
}
