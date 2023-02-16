package com.project.portfolio.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyWorkCalendarDAO;
import com.project.portfolio.dto.CompanyWorkCalendarDTO;

@Service
public class CompanyWorkCalendarServiceImpl implements CompanyWorkCalendarService{

	@Autowired
	CompanyWorkCalendarDAO dao;
	
	//캘린더 호출
	@Override
	public ArrayList<CompanyWorkCalendarDTO> getCalendar(String calendar_emp_department) {
		return dao.getCalendar(calendar_emp_department);
	}
	
	//관리자 캘린더 호출
	@Override
	public ArrayList<CompanyWorkCalendarDTO> getAdminCalendar() {
		return dao.getAdminCalendar();
	}
	
	//캘린더 근태 추가
	@Override
	public void workTypeCalendarInsert(String emp_id, int bno) {
		dao.workTypeCalendarInsert(emp_id, bno);
	}

	
}
