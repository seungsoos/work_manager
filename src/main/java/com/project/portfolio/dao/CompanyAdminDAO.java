package com.project.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;

@Service
public interface CompanyAdminDAO {

	//전체 사원 조회
	public List<CompanyLoginDTO> adminEmployeeSelect(@Param("emp_number") int emp_number,
												@Param("displayPost")int displayPost,
												@Param("postNum") int postNum);
	
	//팀별 사원 조회
	public List<CompanyLoginDTO> adminEmployeeTeam(String emp_department);
	
	//사원카운트
	public int count();
	
	//사원삭제
	public void adminEmployeeDelete(String emp_id);
	
	//근무시간 월별조회
	public List<CompanyTimeCheckDTO> adminEmployeeMonth(@Param("emp_id") String emp_id,
														@Param("select") String select,
														@Param("displayPost") int displayPost,
														@Param("postNum") int postNum);

	//근무시간 월별조회 카운트
	public int countMonth(@Param("emp_id") String emp_id,
							@Param("select") String select);
	
	
	//근무시간수정
	public CompanyTimeCheckDTO adminTimeUpdate(@Param("emp_id") String emp_id,
													@Param("work_date") String work_date);
	
	//근무종료시간 수정반영
	public void adminTimeUpdateResult(@Param("end_time") String end_time,
									@Param("emp_id") String emp_id,
									@Param("work_date") String work_date);
		
	//근무시간 수정반영
	public void adminTotal_TimeUpdate(@Param("emp_id") String emp_id,
										@Param("work_date") String work_date);
}
