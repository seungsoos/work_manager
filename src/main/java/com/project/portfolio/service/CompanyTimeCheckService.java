package com.project.portfolio.service;

import java.util.List;

import com.project.portfolio.dto.CompanyTimeCheckDTO;

public interface CompanyTimeCheckService {
	
	//근무시간확인
	List<CompanyTimeCheckDTO> timeCheck(String emp_id);
	
	//리스트
	public List<CompanyTimeCheckDTO> listPage(String emp_id,int displayPost, int postNum);
	
	//전체 카운트
	int count(String emp_id);

	//전체 카운트
	int countMonth(String emp_id, String select);
	
	//월별근무시간확인
	List<CompanyTimeCheckDTO> timeSelectCheck(String select, String emp_id,
											int displayPost, int postNum);
	
	//월별시간체크
	int selectMonthTimeCheck(String select, String emp_id);
	
	//월별 시간 총합계산
	List<CompanyTimeCheckDTO> month_total_time(String emp_id, String select);
}
