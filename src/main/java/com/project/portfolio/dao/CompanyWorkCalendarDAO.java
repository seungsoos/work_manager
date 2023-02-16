package com.project.portfolio.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyWorkCalendarDTO;

@Service
public interface CompanyWorkCalendarDAO {

	//캘린더 호출
	public ArrayList<CompanyWorkCalendarDTO> getCalendar(@Param("calendar_emp_department") String calendar_emp_department);
	
	//관리자 캘린더 호출
	public ArrayList<CompanyWorkCalendarDTO> getAdminCalendar();
	
	//캘린더 근태 추가
	public void workTypeCalendarInsert(@Param("emp_id") String emp_id,
									@Param("bno") int bno);
}
