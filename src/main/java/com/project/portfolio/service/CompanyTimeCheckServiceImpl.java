package com.project.portfolio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.portfolio.dao.CompanyTimeCheckDAO;
import com.project.portfolio.dto.CompanyTimeCheckDTO;

@Service
public class CompanyTimeCheckServiceImpl implements CompanyTimeCheckService{

	@Autowired
	CompanyTimeCheckDAO dao;
	
	//근무시간확인
	@Override
	public List<CompanyTimeCheckDTO> timeCheck(String emp_id) {
		return dao.timeCheck(emp_id);
	}
	
	//리스트
	@Override
	public List<CompanyTimeCheckDTO> listPage(String emp_id, int displayPost, int postNum) {
		return dao.listPage(emp_id, displayPost, postNum);
	}
	
	//전체 카운트
	@Override
	public int count(String emp_id) {
		return dao.count(emp_id);
	}
	//월별 카운트
	@Override
	public int countMonth(String emp_id, String select) {
		return dao.countMonth(emp_id, select);
	}
	
	//월별근무시간확인
	@Override
	public List<CompanyTimeCheckDTO> timeSelectCheck(String select, String emp_id,
													int displayPost, int postNum) {
		return dao.timeSelectCheck(select, emp_id,displayPost, postNum);
	}
	
	//월별시간체크
	@Override
	public int selectMonthTimeCheck(String select, String emp_id) {
		return dao.selectMonthTimeCheck(select, emp_id);
	}

	//월별 시간 총합계산
	@Override
	public List<CompanyTimeCheckDTO> month_total_time(String emp_id, String select) {
		return dao.month_total_time(emp_id, select);
	}

	

	
		
}
