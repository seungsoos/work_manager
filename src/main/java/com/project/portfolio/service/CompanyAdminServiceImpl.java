package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyAdminDAO;
import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;

@Service
public class CompanyAdminServiceImpl implements CompanyAdminService{

	@Autowired
	CompanyAdminDAO dao;

	//전체 사원 조회
	@Override
	public List<CompanyLoginDTO> adminEmployeeSelect(int emp_number,int displayPost, int postNum) {
		return dao.adminEmployeeSelect(emp_number, displayPost, postNum);
	}
	
	//팀별 사원 조회
	@Override
	public List<CompanyLoginDTO> adminEmployeeTeam(String emp_department) {
		return dao.adminEmployeeTeam(emp_department);
	}
	//사원카운트
	@Override
	public int count() {
		return dao.count();
	}
	//사원 삭제
	@Override
	public void adminEmployeeDelete(String emp_id) {
		dao.adminEmployeeDelete(emp_id);
	}
	//근무시간 월별조회
	@Override
	public List<CompanyTimeCheckDTO> adminEmployeeMonth(String emp_id,
														String select,
														int displayPost,
														int postNum) {
		return dao.adminEmployeeMonth(emp_id, select, displayPost, postNum);
	}

	//근무시간 월별조회 카운트
	@Override
	public int countMonth(String emp_id, String select) {
		return dao.countMonth(emp_id,select);
	}

	//근무시간수정
	@Override
	public CompanyTimeCheckDTO adminTimeUpdate(String emp_id, String work_date) {
		return dao.adminTimeUpdate(emp_id, work_date);
	}

	//근무종료시간 수정반영
	@Override
	public void adminTimeUpdateResult(String end_time, String emp_id, String work_Date) {
		dao.adminTimeUpdateResult(end_time, emp_id, work_Date);
	}
	
	//근무시간 수정반영
	@Override
	public void adminTotal_TimeUpdate(String emp_id, String work_date) {
		dao.adminTotal_TimeUpdate(emp_id, work_date);
	}


	
	
}
