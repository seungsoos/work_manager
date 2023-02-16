package com.project.portfolio.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;

public interface CompanyMainService {

	//bno값 구하기
	int newBno();
	
	//총사원
	int totalEmployee();
	
	//개인정보수정
	public void updateInformation(String emp_id,String emp_rank, String emp_department);
	
	//개인정보수정 후 세션값 수정
	public CompanyLoginDTO updateSession(String emp_id);
	
	//근무시작
	int startTime(String emp_id, String emp_name, int newBno);
	
	//근무종료
	int endTime(String emp_id, String emp_name);
	
	//근무시간
	int total_time(String emp_id, String emp_name);
	
	//야간근무시작
	int night_start_time(String emp_id, String emp_name);
	
	//야간근무종료
	int night_end_time(String emp_id, String emp_name);
	
	//야간근무시간
	int night_total_time(String emp_id, String emp_name);
	
	//주간근무시간가져오기
	List<CompanyTimeCheckDTO> day_of_week(String emp_id);
	
	//카운트
	int workCheck(String emp_id);
	
	//주간 토탈근무 시간가져오기
	String total_day_of_week(@Param("emp_id") String emp_id);

	//야간 토탈근무 시간가져오기
	String total_night_of_week(@Param("emp_id") String emp_id);
}
