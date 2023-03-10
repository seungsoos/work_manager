package com.project.portfolio.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyWorkCalendarDTO;
import com.project.portfolio.service.CompanyWorkCalendarService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/calendarctr")
@Log4j
public class CompanyWorkCalendarController {

	@Autowired
	CompanyWorkCalendarService service;
	
	@GetMapping(value = "/calendar.do")
	public ModelAndView list(HttpServletRequest request, ModelAndView mv) {
		log.info("---캘린더---");
		HttpSession session = request.getSession();
		CompanyLoginDTO employeeLogin = (CompanyLoginDTO)session.getAttribute("employeeLogin");
		String calendar_emp_department = employeeLogin.getEmp_department();
		log.info(calendar_emp_department);
		List<CompanyWorkCalendarDTO> calendar;
		
		if(calendar_emp_department.equals("관리자")) {
			calendar = service.getAdminCalendar();
		}else {
			calendar = service.getCalendar(calendar_emp_department);
		}
		
		String viewpage = "workCalendar/calendar";
		mv.addObject("calendarList", calendar);
		
		mv.setViewName(viewpage);
		
		return mv;
	}
}
