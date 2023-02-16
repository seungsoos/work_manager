package com.project.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;

@Service
public interface CompanyMainDAO {
	
	//bno값 구하기
	int newBno();

	//총사원
	int totalEmployee();
	
	//개인정보수정
	public void updateInformation(@Param("emp_id") String emp_id,
								@Param("emp_rank") String emp_rank,
								@Param("emp_department") String emp_department);
	
	//개인정보수정 후 세션값 수정
	public CompanyLoginDTO updateSession(String emp_id);
	
	//근무시작
	int startTime(@Param("emp_id") String emp_id,
				  @Param("emp_name") String emp_name,
				  @Param("newBno") int newBno);
	
	//근무종료
	int endTime(@Param("emp_id") String emp_id,
			  	 @Param("emp_name") String emp_name);
	
	//근무시간
	int total_time(@Param("emp_id") String emp_id,
		  	 	@Param("emp_name") String emp_name);
	
	//야간근무시작
	int night_start_time(@Param("emp_id") String emp_id,
					@Param("emp_name") String emp_name);
	//야간근무종료
	int night_end_time(@Param("emp_id") String emp_id,
					@Param("emp_name") String emp_name);
	
	//야간근무시간
	int night_total_time(@Param("emp_id") String emp_id,
					@Param("emp_name") String emp_name);
	
	//출근여부
	int workCheck(@Param("emp_id") String emp_id);
	
	//주간근무시간가져오기
	List<CompanyTimeCheckDTO> day_of_week(@Param("emp_id") String emp_id);

	//주간 토탈근무 시간가져오기
	String total_day_of_week(@Param("emp_id") String emp_id);
	
	//야간 토탈근무 시간가져오기
	String total_night_of_week(@Param("emp_id") String emp_id);

}
