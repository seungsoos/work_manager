package com.project.portfolio.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.project.portfolio.dto.CompanyTimeCheckDTO;

@Service
public interface CompanyTimeCheckDAO {

	//근무시간확인
	List<CompanyTimeCheckDTO> timeCheck(@Param("emp_id") String emp_id);

	//리스트
	public List<CompanyTimeCheckDTO> listPage(@Param("emp_id") String emp_id,
											@Param("displayPost")int displayPost,
											@Param("postNum") int postNum);
	
	//전체 카운트
	int count(@Param("emp_id") String emp_id);

	//월별 카운트
	int countMonth(@Param("emp_id") String emp_id, @Param("select") String select);
	
	//월별근무시간확인
	List<CompanyTimeCheckDTO> timeSelectCheck(@Param("select") String select,
												@Param("emp_id") String emp_id,
												@Param("displayPost")int displayPost,
												@Param("postNum") int postNum);

	//월별시간체크
	int selectMonthTimeCheck(@Param("select") String select,
								@Param("emp_id") String emp_id);
	
	//월별 시간 총합계산
	List<CompanyTimeCheckDTO> month_total_time(@Param("emp_id") String emp_id,
											@Param("select") String select);
}
