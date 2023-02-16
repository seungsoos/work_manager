package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyWorkTypeApproverDAO;
import com.project.portfolio.dto.CompanyWorkTypeDTO;

@Service
public class CompanyWorkTypeApproverServiceImpl implements CompanyWorkTypeApproverService{

	@Autowired
	CompanyWorkTypeApproverDAO dao;
	
	//결재대기리스트
	@Override
	public List<CompanyWorkTypeDTO> listPage(String emp_id, String app_status) {
		return dao.listPage(emp_id, app_status);
	}

	//승인처리
	@Override
	public void approverAllow(String emp_id, String app_status) {
		dao.approverAllow(emp_id, app_status);
	}

	//반려처리
	@Override
	public void approverDisallow(String emp_id, String app_status) {
		dao.approverDisallow(emp_id, app_status);
	}

}
