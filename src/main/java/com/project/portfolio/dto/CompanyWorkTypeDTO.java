package com.project.portfolio.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class CompanyWorkTypeDTO {

	private int bno;
	private String emp_id;
	private String emp_department;
	private String emp_rank;
	private String emp_name;
	private Date work_date_start;
	private Date work_date_end;
	private String work_type;
	private String work_content;
	private String approver_emp_id;
	private String final_approver;
	
}
