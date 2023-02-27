package com.project.portfolio.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;
import com.project.portfolio.dto.CompanyWorkTypeDTO;
import com.project.portfolio.service.CompanyMainService;
import com.project.portfolio.service.CompanyTimeCheckService;
import com.project.portfolio.service.CompanyWorkTypeService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/mainctr")
@Log4j
public class CompanyMainController {

	@Autowired
	CompanyMainService service;
	
	@Autowired
	CompanyTimeCheckService timeCheckService;
	
	@Autowired
	CompanyWorkTypeService workTypeService;
	
	@RequestMapping(value = "/main.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String main(HttpServletRequest request, Model model){
		log.info("---메인페이지---");
		
		//------------------주간 근무시간 출력------------------
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar now = Calendar.getInstance();
		String nowTime1 = sdf1.format(now.getTime());
	    String select = nowTime1.substring(0,7);
	    select += "%";
	    System.out.println(select);
	    //------------------주간 근무시간 출력------------------
	    
	    //------------------세션 작업------------------
	    HttpSession session =request.getSession();	
	    System.out.println("세션시간 : " + session.getMaxInactiveInterval());
		String emp_id = (String) session.getAttribute("emp_id");
		//------------------세션 작업------------------
		//------------------메인페이지 전시 요일별 작업------------------
		int result = service.workCheck(emp_id);
		int totalEmployee = service.totalEmployee();
		
		List<CompanyTimeCheckDTO> timeList = timeCheckService.month_total_time(emp_id, select);
		List<CompanyTimeCheckDTO> day_of_week = service.day_of_week(emp_id);
		
		HashMap<String , String> map = new HashMap<String, String>();
		
		
		for(CompanyTimeCheckDTO day : day_of_week) {
			map.put(day.getDay_of_week(), day.getTotal_time());
			map.put(day.getDay_of_week()+"야간", day.getNight_total_time());
		}
		
		//주간 토탈 근무시간
		String total_day_of_week = service.total_day_of_week(emp_id);
		
		//야간 토탈 근무시간
		String total_night_of_week =service.total_night_of_week(emp_id);

		//------------------메인페이지 전시 요일별 작업------------------
		//------------------근태버튼 적용기준값 생성------------------
		Date nowTime = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sfMain = new SimpleDateFormat("yyyy년 MM월 dd일");
		String today = sf.format(nowTime);
		String todayMain = sfMain.format(nowTime);
		boolean work_date = false;
		boolean start_time = false;
		boolean end_time = false;
		boolean night_start_time = false;
		boolean night_end_time = false;
		
		if(!(timeList.isEmpty())) {
			for(CompanyTimeCheckDTO list : timeList) {
				String work_status = list.getWork_date()+"";
				String start_time_status_ = list.getStart_time();
				String end_time_status = list.getEnd_time();
				String night_start_time_status = list.getNight_start_time();
				String night_end_time_status = list.getNight_end_time();
				
				if(work_status != null && today.equals(work_status))work_date = true;
				if(start_time_status_ != null && today.equals(start_time_status_.substring(0,10))) start_time = true;
				if(end_time_status != null && today.equals(end_time_status.substring(0,10))) end_time = true;
				if(night_start_time_status != null && today.equals(night_start_time_status.substring(0,10))) night_start_time = true;
				if(night_end_time_status != null && today.equals(night_end_time_status.substring(0,10))) night_end_time = true;
			}
		}
		HashMap<String, Boolean> workMap = new HashMap<String, Boolean>();
		workMap.put("work_date", work_date);
		workMap.put("start_time", start_time);
		workMap.put("end_time", end_time);
		workMap.put("night_start_time", night_start_time);
		workMap.put("night_end_time", night_end_time);
		//------------------근태버튼 적용기준값 생성------------------
		String final_approver = "결재완료";
		List<CompanyWorkTypeDTO> workTypeList = workTypeService.work_typeList(final_approver);
		
		//------------------상단 근무 타입 출력------------------
		int business_work = 0;
		int out_work = 0;
		int home_work = 0;
		int vacation = 0;
		
		for(CompanyWorkTypeDTO list : workTypeList) {
			System.out.println(list.getWork_type());
			switch (list.getWork_type()) {
			case "외근" : out_work++;
				break;
			case "출장" : business_work++;
				break;
			case "휴가" : vacation++;
				break;
			case "재택근무" : home_work++;
				break;
			}
		}
		
		int goToWork = workTypeService.goToWork();
		int leaveWork = workTypeService.leaveWork();
		int nightShift = workTypeService.nightShift();
		
		
		HashMap<String, Integer> workTypeMap = new HashMap<String, Integer>();
		workTypeMap.put("totalEmployee", totalEmployee);
		workTypeMap.put("out_work", out_work);
		workTypeMap.put("business_work", business_work);
		workTypeMap.put("vacation", vacation);
		workTypeMap.put("home_work", home_work);
		workTypeMap.put("goToWork", goToWork);
		workTypeMap.put("leaveWork", leaveWork);
		workTypeMap.put("nightShift", nightShift);
		System.out.println("-----------------------------------------");
		System.out.println(totalEmployee);
		System.out.println(out_work);
		System.out.println(business_work);
		System.out.println(vacation);
		System.out.println(home_work);
		System.out.println(goToWork);
		System.out.println(leaveWork);
		System.out.println(nightShift);
		System.out.println("-----------------------------------------");
		//------------------상단 근무 타입 출력------------------
		session.setAttribute("workTypeMap", workTypeMap);
		
		model.addAttribute("employeeLogin",session.getAttribute("employeeLogin"));
		model.addAttribute("result",result);
		model.addAttribute("totalEmployee",totalEmployee);
		model.addAttribute("timeList",timeList);
		model.addAttribute("workMap",workMap);
		model.addAttribute("todayMain",todayMain);
		model.addAttribute("day_of_week",day_of_week);
		model.addAttribute("map",map);
		model.addAttribute("total_day_of_week",total_day_of_week);
		model.addAttribute("total_night_of_week",total_night_of_week);
		
		return "main/companyMain";
	}
	
	@GetMapping(value = "/updateInformation.do")
	public String updateInformation() {
		log.info("---개인정보수정---");
		
		
		return "main/updateInformation";
	}
	
	@PostMapping(value = "/updateInformationResult.do")
	public String updateInformationResult(HttpServletRequest request) {
		log.info("---개인정보수정결과---");
		String emp_id = request.getParameter("emp_id");
		String emp_rank = request.getParameter("emp_rank");
		String emp_department = request.getParameter("emp_department");
		
		service.updateInformation(emp_id, emp_rank, emp_department);
		CompanyLoginDTO dto = service.updateSession(emp_id);
		
		//개인정보 수정 후 세션작업
		HttpSession session = request.getSession();
		session.setAttribute("employeeLogin", dto);
		session.setMaxInactiveInterval(3600);
		
		return "forward:/mainctr/main.do";
	}
	
	@ResponseBody
	@PostMapping(value = "/startTime.do")
	public int startTime(@RequestBody HashMap<String, String> hashMap) {
		log.info("---근무시작---");
		String emp_id = hashMap.get("emp_id");
		String emp_name = hashMap.get("emp_name");

		System.out.println(emp_id);
		System.out.println(emp_name);
		
		int newBno;
		if(service.bnoCheck() == 0) {
			newBno = 1;
		}else {
			newBno = service.newBno();
		}
		
		int result = service.startTime(emp_id, emp_name, newBno);
		System.out.println(result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/endTime.do")
	public int stopTime(@RequestBody HashMap<String, String> hashMap) {
		log.info("---근무종료---");
		
		String emp_id = hashMap.get("emp_id");
		String emp_name = hashMap.get("emp_name");

		int result = service.endTime(emp_id, emp_name);
		int total = service.total_time(emp_id, emp_name);
		
		System.out.println("근무종료 : " + result);
		System.out.println("토탈 : " + total);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/night_start_time.do")
	public int restartTime(@RequestBody HashMap<String, String> hashMap) {
		log.info("---야간근무시작---");
		
		String emp_id = hashMap.get("emp_id");
		String emp_name = hashMap.get("emp_name");
		System.out.println(emp_id + emp_name);
		
		int result = service.night_start_time(emp_id, emp_name);
		System.out.println(result);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/night_end_time.do")
	public int endTime(@RequestBody HashMap<String, String> hashMap) {
		log.info("---야간근무종료---");
		
		String emp_id = hashMap.get("emp_id");
		String emp_name = hashMap.get("emp_name");

		int result = service.night_end_time(emp_id, emp_name);
		int total = service.night_total_time(emp_id, emp_name);
		
		System.out.println("야간근무종료 : " +result);
		System.out.println("토탈 : " + total);
		
		return result;
	}
	
	@GetMapping(value = "/timeCheck.do")
	public String timeCheck() {
		log.info("---근무 시간 확인---");
		
		return "forward:/timecheckctr/timeCheck.do?num=1";
	}

	@GetMapping(value = "/workDiary.do")
	public String workDiary() {
		log.info("---업무 공유---");
		
		return "forward:/workdiaryctr/workDiary.do";
	}
	
	@GetMapping(value = "logout.do")
	public String logout(HttpServletRequest request) {
		log.info("---로그아웃---");
		HttpSession session =request.getSession();	
		session.invalidate();
		
		return "login/companyLogin";
	}
}
