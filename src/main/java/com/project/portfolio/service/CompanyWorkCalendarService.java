package com.project.portfolio.service;

import java.util.ArrayList;

import com.project.portfolio.dto.CompanyWorkCalendarDTO;

public interface CompanyWorkCalendarService {

	//캘린더 호출
	ArrayList<CompanyWorkCalendarDTO> getCalendar(String calendar_emp_department);
	
	//관리자 캘린더 호출
	ArrayList<CompanyWorkCalendarDTO> getAdminCalendar();
		
	//캘린더 근태 추가
	public void workTypeCalendarInsert(String emp_id, int bno);
}
