package com.project.portfolio.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class CompanyTimeCheckDTO {

	private String emp_id;
	private String emp_name;
	private int bno;
	private String work_date;
	private String day_of_week;
	private String start_time;
	private String end_time;
	private String total_time;
	private String night_start_time;
	private String night_end_time;
	private String night_total_time;
}
