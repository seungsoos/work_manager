package com.project.portfolio.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class CompanyLoginDTO {

	private int emp_number;
	private String emp_id;
	private String emp_pwd;
	private String emp_name;
	private String emp_rank;
	private Date emp_birth;
	private String emp_gender;
	private String emp_department;
	private int emp_rank_number;
}
