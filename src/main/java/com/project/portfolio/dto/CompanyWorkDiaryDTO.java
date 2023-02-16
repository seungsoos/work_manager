package com.project.portfolio.dto;

import java.sql.Date;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class CompanyWorkDiaryDTO {
	
	private String emp_id;
	private String emp_rank;
	private String emp_name;
	private String emp_department;
	private int bno;
	private int articleNo;
	private int parentNo;
	private String diary_title;
	private String diary_content;
	private Date diary_date;
}
