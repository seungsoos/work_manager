package com.project.portfolio.service;

import com.project.portfolio.dto.CompanyLoginDTO;

public interface CompanyLoginService {
	
	//회원등록	
	void insertEmployee(CompanyLoginDTO dto);
	
	//아이디찾기
	String idSearch(int emp_number, String emp_department, String emp_name, String emp_rank);
	
	//비밀번호찾기
	String pwdSearch(String emp_id,int emp_number, String emp_department, String emp_name, String emp_rank);
	
	//비밀번호변경
	int pwdChange(String emp_id, String emp_pwd);
	
	//아이디 중복체크 
	int idCheck(String emp_id);
	
	//로그인
	CompanyLoginDTO login(String emp_id, String emp_pwd);
	 
}

