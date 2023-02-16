package com.project.portfolio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyLoginDAO;
import com.project.portfolio.dto.CompanyLoginDTO;

@Service
public class CompanyLoginServiceImpl implements CompanyLoginService{

	@Autowired
	private CompanyLoginDAO dao;
	// --------------------- 로그인 페이지 영역  ---------------------	
	//회원등록
	@Override
	public void insertEmployee(CompanyLoginDTO dto) {
		dao.insertEmployee(dto);
	}
	//아이디찾기
	@Override
	public String idSearch(int emp_number, String emp_department, String emp_name, String emp_rank) {
		return dao.idSearch(emp_number, emp_department, emp_name, emp_rank);
	}
	//비밀번호찾기
	@Override
	public String pwdSearch(String emp_id, int emp_number, String emp_department, String emp_name, String emp_rank) {
		return dao.pwdSearch(emp_id, emp_number, emp_department, emp_name, emp_rank);
	}
	//비밀번호변경
	@Override
	public int pwdChange(String emp_id, String emp_pwd) {
		return dao.pwdChange(emp_id, emp_pwd);
	}
	//아이디 중복체크
	@Override
	public int idCheck(String emp_id) {
		return dao.idCheck(emp_id);
	}
	//로그인
	@Override
	public CompanyLoginDTO login(String emp_id, String emp_pwd) {
		return dao.login(emp_id, emp_pwd);
	}
	// --------------------- 메인 페이지 영역  ---------------------
}
