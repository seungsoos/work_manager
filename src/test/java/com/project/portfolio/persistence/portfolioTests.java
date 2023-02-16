package com.project.portfolio.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.project.portfolio.dao.CompanyLoginDAO;
import com.project.portfolio.dto.CompanyLoginDTO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class portfolioTests {

	@Autowired
	CompanyLoginDAO dao;
	
	@Autowired
	CompanyLoginDTO dto;
	
	@Test
	public void daoTest() {
		dao.insertEmployee(dto);
	}
}
