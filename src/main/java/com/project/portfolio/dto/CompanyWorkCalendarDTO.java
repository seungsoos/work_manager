package com.project.portfolio.dto;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class CompanyWorkCalendarDTO {
	
	private int calendarNo;
	private String calendar_emp_id;
	private String calendar_emp_rank;
	private String calendar_emp_name;
	private String calendar_emp_department;
	private String calendarTitle;
	private String calendarMemo;
	private String calendarStart;
	private String calendarEnd;
}
