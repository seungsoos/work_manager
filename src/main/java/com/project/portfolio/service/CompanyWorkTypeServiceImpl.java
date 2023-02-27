package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyWorkTypeDAO;
import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyWorkTypeDTO;

@Service
public class CompanyWorkTypeServiceImpl implements CompanyWorkTypeService{

	@Autowired
	CompanyWorkTypeDAO dao;

	//결재자 지정
	@Override
	public List<CompanyLoginDTO> approverSearch(String emp_name) {
		return dao.approverSearch(emp_name);
	}

	//결재요청보내기
	@Override
	public void approverRequest(CompanyWorkTypeDTO dto) {
		dao.approverRequest(dto);
	}
	//근태신청현황
	public List<CompanyWorkTypeDTO> workTypeStatus(String emp_department, int displayPost, int postNum) {
		return dao.workTypeStatus(emp_department, displayPost, postNum);
	}
	//관리자 접속 근태신청현황
	@Override
	public List<CompanyWorkTypeDTO> workTypeStatusAdmin(int displayPost, int postNum) {
		return dao.workTypeStatusAdmin(displayPost, postNum);
	}
	
	// 게시물 총 갯수
	@Override
	public int count(String emp_department) {
		return dao.count(emp_department);
	}
	
	//관리자 접속시 게시물 
	@Override
	public int countAdmin() {
		return dao.countAdmin();
	}
	
	//Main Page work_type 출력문
	@Override
	public List<CompanyWorkTypeDTO> work_typeList(String final_approver) {
		return dao.work_typeList(final_approver);
	}

	//출근 카운트
	@Override
	public int goToWork() {
		return dao.goToWork();
	}

	//야근 카운트
	@Override
	public int nightShift() {
		return dao.nightShift();
	}

	//퇴근 카운트
	@Override
	public int leaveWork() {
		return dao.leaveWork();
	}

	




}
