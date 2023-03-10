package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyMainDAO;
import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;

@Service
public class CompanyMainServiceImpl implements CompanyMainService{

	@Autowired
	private CompanyMainDAO dao;
	
	
	@Override
	public int bnoCheck() {
		return dao.bnoCheck();
	}
	
	@Override
	public int newBno() {
		return dao.newBno();
	}
	
	@Override
	public int totalEmployee() {
		return dao.totalEmployee();
	}
	
	//개인정보수정
	@Override
	public void updateInformation(String emp_id, String emp_rank, String emp_department) {
		dao.updateInformation(emp_id, emp_rank, emp_department);
	}
	
	//개인정보수정 후 세션값 수정
	@Override
	public CompanyLoginDTO updateSession(String emp_id) {
		return dao.updateSession(emp_id);
		}
	
	@Override
	public int startTime(String emp_id, String emp_name, int newBno) {
		return dao.startTime(emp_id, emp_name, newBno);
	}

	@Override
	public int endTime(String emp_id, String emp_name) {
		return dao.endTime(emp_id, emp_name);
	}

	@Override
	public int total_time(String emp_id, String emp_name) {
		return dao.total_time(emp_id, emp_name);
	}
	
	@Override
	public int night_start_time(String emp_id, String emp_name) {
		return dao.night_start_time(emp_id, emp_name);
	}

	@Override
	public int night_end_time(String emp_id, String emp_name) {
		return dao.night_end_time(emp_id, emp_name);
	}

	@Override
	public int night_total_time(String emp_id, String emp_name) {
		return dao.night_total_time(emp_id, emp_name);
	}
	
	@Override
	public int workCheck(String emp_id) {
		return dao.workCheck(emp_id);
	}

	@Override
	public List<CompanyTimeCheckDTO> day_of_week(String emp_id) {
		return dao.day_of_week(emp_id);
	}
	//주간 토탈근무 시간가져오기
	@Override
	public String total_day_of_week(String emp_id) {
		return dao.total_day_of_week(emp_id);
	}
	//야간 토탈근무 시간가져오기
	@Override
	public String total_night_of_week(String emp_id) {
		return dao.total_night_of_week(emp_id);
	}

	//계정삭제
	@Override
	public void delete(String emp_id) {
		dao.delete(emp_id);
	}

	
	




	



	

}
