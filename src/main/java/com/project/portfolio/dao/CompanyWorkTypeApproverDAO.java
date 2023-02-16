package com.project.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyWorkTypeDTO;

@Service
public interface CompanyWorkTypeApproverDAO {
	
	//결재대기리스트
	public List<CompanyWorkTypeDTO> listPage(@Param("emp_id") String emp_id,
							@Param("app_status") String app_status);
	//승인처리
	public void approverAllow(@Param("emp_id") String emp_id,
							@Param("app_status") String app_status);
	
	//반려처리
	public void approverDisallow(@Param("emp_id") String emp_id,
							@Param("app_status") String app_status);
}
