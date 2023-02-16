package com.project.portfolio.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyLoginDTO;

@Service
public interface CompanyLoginDAO {

	// --------------------- 로그인 페이지 영역  ---------------------
	//회원등록	
	void insertEmployee(CompanyLoginDTO dto);
	//아이디찾기
	String idSearch(@Param("emp_number") int emp_number, 
					@Param("emp_department") String emp_department,
					@Param("emp_name") String emp_name,
					@Param("emp_rank") String emp_rank);
	//비밀번호찾기
	String pwdSearch(@Param("emp_id") String emp_id,
					@Param("emp_number") int emp_number,
					@Param("emp_department") String emp_department,
					@Param("emp_name") String emp_name,
					@Param("emp_rank") String emp_rank);
	//비밀번호변경	
	int pwdChange(@Param("emp_id") String emp_id,
				@Param("emp_pwd") String emp_pwd);
	//아이디 중복체크 
	int idCheck(@Param("emp_id") String emp_id);
	//로그인
	CompanyLoginDTO login(@Param("emp_id") String emp_id,
				@Param("emp_pwd") String emp_pwd);
	

}
