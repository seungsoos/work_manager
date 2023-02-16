package com.project.portfolio.service;

import java.util.List;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;

public interface CompanyAdminService {

	//전체 사원 조회
	public List<CompanyLoginDTO> adminEmployeeSelect(int emp_number,int displayPost, int postNum);

	//팀별 사원 조회
	public List<CompanyLoginDTO> adminEmployeeTeam(String emp_department);
	
	//사원카운트
	public int count();
		
	//사원 삭제
	public void adminEmployeeDelete(String emp_id);
	
	//근무시간 월별조회
	public List<CompanyTimeCheckDTO> adminEmployeeMonth(String emp_id,
														String select,
														int displayPost,
														int postNum);

	//근무시간 월별조회 카운트
	public int countMonth(String emp_id, String select);
	
	//근무시간수정
	public CompanyTimeCheckDTO adminTimeUpdate(String emp_id, String work_date);

	//근무종료시간 수정반영
	public void adminTimeUpdateResult(String end_time, String emp_id, String work_Date);

	//근무시간 수정반영
	public void adminTotal_TimeUpdate(String emp_id, String work_date);
}



