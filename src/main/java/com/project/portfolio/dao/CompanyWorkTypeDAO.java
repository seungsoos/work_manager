package com.project.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyLoginDTO;
import com.project.portfolio.dto.CompanyWorkTypeDTO;

@Service
public interface CompanyWorkTypeDAO {

	//결재자 지정
	List<CompanyLoginDTO> approverSearch(@Param("emp_name") String emp_name);
	
	//결재요청보내기
	public void approverRequest(CompanyWorkTypeDTO dto);
	
	//근태신청현황
	public List<CompanyWorkTypeDTO> workTypeStatus(@Param("emp_department") String emp_department,
													@Param("displayPost") int displayPost,
													@Param("postNum") int postNum);
	//관리자 접속 근태신청현황
	public List<CompanyWorkTypeDTO> workTypeStatusAdmin(@Param("displayPost") int displayPost,
														@Param("postNum") int postNum);
	
	// 게시물 총 갯수
	public int count(@Param("emp_department")String emp_department);
	
	//관리자 접속 게시물
	public int countAdmin();
		
	//Main Page work_type 출력문
	public List<CompanyWorkTypeDTO> work_typeList(@Param("final_approver") String final_approver);

	//출근 카운트
	public int goToWork();
	
	//야근 카운트
	public int nightShift();
	
	//퇴근 카운트
	public int leaveWork();
	
}
