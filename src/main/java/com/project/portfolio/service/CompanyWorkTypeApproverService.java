package com.project.portfolio.service;

import java.util.List;

import com.project.portfolio.dto.CompanyWorkTypeDTO;

public interface CompanyWorkTypeApproverService {

	//결재대기리스트
	List<CompanyWorkTypeDTO> listPage(String emp_id, String app_status);
	
	//승인처리
	public void approverAllow(String emp_id, String app_status);
	
	//반려처리
	public void approverDisallow(String emp_id, String app_status);
}
