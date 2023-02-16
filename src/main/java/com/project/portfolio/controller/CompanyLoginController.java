package com.project.portfolio.controller;

import java.sql.Date;
import java.util.HashMap;

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
import com.project.portfolio.service.CompanyLoginService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/loginctr")
@Log4j
public class CompanyLoginController {

	@Autowired
	CompanyLoginService service;
	
	@Autowired
	CompanyLoginDTO dto;
	
	@RequestMapping(value = "/login.do", 
					method = {RequestMethod.GET, RequestMethod.POST})
	public String companyLogin() {	
		log.info("---로그인페이지---");
		
		return "login/companyLogin";
	}
	
	@GetMapping(value = "/agree.do")
	public String companyAgree() {
		log.info("---약관동의 페이지---");
		
		return "login/companyAgree";
	}
	
	@PostMapping(value = "/join.do")
	public String companyJoin() {
		log.info("---회원가입 페이지---");
		
		return "login/companyJoin";
	}
	
	@PostMapping(value = "/joinSuccess.do")
	public String companyJoinSuccess(HttpServletRequest request,
									@RequestParam("emp_birth") Date emp_birth){
		dto.setEmp_id(request.getParameter("emp_id"));
		dto.setEmp_pwd(request.getParameter("emp_pwd"));
		dto.setEmp_name(request.getParameter("emp_name"));
		dto.setEmp_rank(request.getParameter("emp_rank"));
		dto.setEmp_department(request.getParameter("emp_department"));
		dto.setEmp_birth(emp_birth);
		dto.setEmp_gender(request.getParameter("emp_gender"));
		
		int emp_rank_number =0; 
		
		switch (dto.getEmp_rank()) {
		case "부장":
			emp_rank_number = 1;
			break;
		case "차장":
			emp_rank_number = 2;
			break;
		case "과장":
			emp_rank_number = 3;
			break;
		case "대리":
			emp_rank_number = 4;
			break;
		case "주임":
			emp_rank_number = 5;
			break;
		case "사원":
			emp_rank_number = 6;
			break;
		}
		dto.setEmp_rank_number(emp_rank_number);
		
		
		
		service.insertEmployee(dto);
		
		log.info("---회원가입 완료---");
		
		return "login/companyLogin";
	}
	
	
	@GetMapping(value = "/idSearch.do")
	public String companyIdSearch() {
		log.info("---아이디 찾기 페이지---");
		
		return "login/companyIdSearch";
	}
	
	@GetMapping(value = "/idResult.do")
	public String companyIdResult(HttpServletRequest request,
			  Model model) {
		log.info("---아이디 찾기 결과 페이지---");
		int emp_number = Integer.parseInt(request.getParameter("emp_number"));
		String emp_department = request.getParameter("emp_department");
		String emp_name = request.getParameter("emp_name");
		String emp_rank = request.getParameter("emp_rank");
		String emp_id = service.idSearch(emp_number, emp_department, emp_name, emp_rank);
		System.out.println("id찾은값 : " + emp_id);
		model.addAttribute("emp_id", emp_id);
		
		return "login/companyIdResult";
	}
	
	@GetMapping(value = "/pwSearch.do")
	public String companyPwSearch() {
		log.info("---비밀번호 찾기 페이지---");
		
		return "login/companyPwSearch";
	}
	
	@PostMapping(value = "/pwResult.do")
	public String companyPwResult(HttpServletRequest request, Model model) {
		log.info("---비밀번호 찾기 결과 페이지---");
		
		String emp_id = request.getParameter("emp_id");
		int emp_number = Integer.parseInt(request.getParameter("emp_number"));
		String emp_department = request.getParameter("emp_department");
		String emp_name = request.getParameter("emp_name");
		String emp_rank = request.getParameter("emp_rank");
		
		
		String emp_pwd = service.pwdSearch(emp_id, emp_number, emp_department, emp_name, emp_rank);
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("emp_pwd", emp_pwd);
		
		return "login/companyPwResult";
	}
	
	@PostMapping(value = "/pwChange.do")
	public String companyPwChange(HttpServletRequest request, Model model) {
		log.info("---비밀번호 수정 페이지---");
		String emp_id = request.getParameter("emp_id");
		System.out.println("아이디 :" + emp_id);
		String emp_pwd = request.getParameter("emp_pwd");
		System.out.println("비밀번호 : " + emp_pwd);
		
		
		model.addAttribute("emp_id", emp_id);
		model.addAttribute("emp_pwd", emp_pwd);
		
		return "login/companyPwChange";
	}
	
	@PostMapping(value = "/pwChangeResult.do")
	public String companyPwChangeResult(Model model, HttpServletRequest request) {
		log.info("---비밀번호 수정 후 로그인페이지 이동---");
		String emp_id = request.getParameter("emp_id");
		System.out.println("아이디 :" + emp_id);
		String emp_pwd = request.getParameter("emp_pwd");
		System.out.println("비밀번호: " + emp_pwd);
		
		service.pwdChange(emp_id, emp_pwd);
		
		return "login/companyLogin";
	}
	
	@ResponseBody
	@PostMapping(value = "/idCheck.do")
	public int idCheck(@RequestBody HashMap<String, String> hashMap) {
		log.info("---아이디 중복 체크---");
		String emp_id = hashMap.get("emp_id");
		
		int idValue =service.idCheck(emp_id);
		
		System.out.println("리턴값확인 : " + idValue);
		
		return idValue;
	}
	
	@PostMapping(value = "/loginSuccess.do")
	public String loginSuccess(@RequestBody HashMap<String, String> login,
												HttpServletRequest request){
		String emp_id = login.get("emp_id");
		String emp_pwd = login.get("emp_pwd");
		
		dto = service.login(emp_id, emp_pwd);
		log.info("---로그인 성공---");
		System.out.println(dto);
		if(dto != null) {
			HttpSession session =request.getSession();		
			session.setAttribute("employeeLogin", dto);
			session.setAttribute("emp_id", dto.getEmp_id());
			session.setMaxInactiveInterval(3600);
			System.out.println("로그인완료~~~");
			
			return "redirect:/mainctr/main.do";
			
		}else {
			return "";
		}
		
	}
}
