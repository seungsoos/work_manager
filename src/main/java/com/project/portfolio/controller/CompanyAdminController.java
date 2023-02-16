package com.project.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;
import com.project.portfolio.service.CompanyAdminService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/adminctr")
@Log4j
public class CompanyAdminController {

	@Autowired
	CompanyAdminService service;
	
	@RequestMapping(value = "/employeeAdmin.do",method = {RequestMethod.GET,RequestMethod.POST})
	public String employeeAdmin(@RequestParam("num") int num, Model model) {
		log.info("---사원관리---");
		int emp_number = 0;
		int count = service.count();
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
		
		List<CompanyLoginDTO> employeeList = service.adminEmployeeSelect(emp_number, displayPost, postNum);
		
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("select", num);
		return "admin/CompanyEmployeeAdmin";
	}
	
	@PostMapping(value = "/employeeTeamAdmin.do")
	public String employeeTeamAdmin(HttpServletRequest request, Model model) {
		log.info("---팀별 사원관리---");
		String emp_department = request.getParameter("emp_department");
		
		List<CompanyLoginDTO> employeeList = service.adminEmployeeTeam(emp_department);
		model.addAttribute("employeeList", employeeList);
		
		return "admin/CompanyEmployeeAdmin";
	}
	
	
	
	@GetMapping(value = "/employeeDelete.do")
	public String employeeDelete(HttpServletRequest request) {
		log.info("---사원삭제---");
		String emp_id = request.getParameter("emp_id");
		service.adminEmployeeDelete(emp_id);
		
		return "forward:/adminctr/employeeAdmin.do?num=1";
	}
	
	@RequestMapping(value = "/timeCheckAdmin.do", 
					method = {RequestMethod.GET, RequestMethod.POST})
	public String timeCheckAdmin(HttpServletRequest request,Model model) {
		log.info("---근무시간관리---");
		String emp_id = request.getParameter("emp_id");
		System.out.println("아이디 : " + emp_id);
		
		model.addAttribute("emp_id", emp_id);
		return "admin/CompanyTimeCheckAdmin";
	}
	
	@RequestMapping(value = "/timeCheckMonthAdmin.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String timeCheckMonthAdmin(HttpServletRequest request,
									@Param("num") int num, Model model) {
		log.info("---월별근무시간학인---");
		
		String select =  request.getParameter("select");
		String emp_id =  request.getParameter("emp_id");
		System.out.println("num값 확인 : " +  num);
		System.out.println(select);
		System.out.println(emp_id);
		
		int count = service.countMonth(emp_id, select);
		System.out.println(count);
		int postNum = 10;
		int pageNum = (int) Math.ceil((double) count / postNum);
		int displayPost = (num - 1) * postNum;
		int pageNum_cnt = 10;
		int endPageNum = (int) (Math.ceil((double) num / (double) pageNum_cnt) * pageNum_cnt);
		int startPageNum = endPageNum - (pageNum_cnt - 1);
		int endPageNum_tmp = (int) (Math.ceil((double) count / (double) pageNum_cnt));

		if (endPageNum > endPageNum_tmp) {
			endPageNum = endPageNum_tmp;
		}
		boolean prev = startPageNum == 1 ? false : true;
		boolean next = endPageNum * pageNum_cnt >= count ? false : true;

		List<CompanyTimeCheckDTO> list = service.adminEmployeeMonth(emp_id, select, displayPost, postNum);
		System.out.println(list);
		
		
		model.addAttribute("startPageNum", startPageNum);
		model.addAttribute("endPageNum", endPageNum);
		model.addAttribute("prev", prev);
		model.addAttribute("next", next);
		model.addAttribute("list", list);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("check", num);
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("select", select);
		 
		return "admin/CompanyTimeCheckAdmin";
	}
	
	@GetMapping(value = "/timeUpdateAdmin.do")
	public String timeUpdateAdmin(HttpServletRequest request, Model model) {
		log.info("---근무시간수정---");
		String emp_id = request.getParameter("emp_id");
		String work_date = request.getParameter("work_date");
		System.out.println(emp_id);
		System.out.println(work_date);
		
		CompanyTimeCheckDTO timeList = service.adminTimeUpdate(emp_id, work_date);
		
		System.out.println(timeList);
		
		model.addAttribute("timeList", timeList);
		
		return "admin/CompanyTimeUpdateAdmin";
	}
	
	@PostMapping(value = "/timeUpdateResultAdmin.do")
	public String timeUpdateResultAdmin(HttpServletRequest request) {
		log.info("---근무시간 수정 페이지---");
		String emp_id = request.getParameter("emp_id");
		String work_date = request.getParameter("work_date");
		String end_time = request.getParameter("end_time");
		
		service.adminTimeUpdateResult(end_time, emp_id, work_date);
		service.adminTotal_TimeUpdate(emp_id, work_date);
		
		return "forward:/adminctr/timeCheckAdmin.do";
	}
	
}
