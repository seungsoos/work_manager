package com.project.portfolio.persistence;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.content;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultMatcher;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.project.portfolio.service.CompanyLoginService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
})
@Log4j
@WebAppConfiguration
public class CompanyLoginTests {
	
	@Autowired
	CompanyLoginService service;
	
	@Inject
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setUp() throws Exception{
		mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	//로그인 테스트
	@Test
	public void login() throws Exception{
		
		this.mockMvc.perform(get("/loginctr/login.do")
				.param("emp_id", "loginid01")
				.param("emp_pwd", "loginpwd01")
				)
				.andExpect(status().isOk())
				.andDo(print());

	}
	
	//ID찾기
	@Test
	public void idSearch()throws Exception {
		mockMvc.perform(get("/loginctr/idResult.do")
				.param("emp_number", "1040")
				.param("emp_department", "인사")
				.param("emp_name", "김부장")
				.param("emp_rank", "부장"))
		.andExpect(status().isOk())
		.andExpect((ResultMatcher) content().string("emp_id"));
	}
	
	//PWD찾기
		@Test
		public void pwdSearch()throws Exception {
			mockMvc.perform(get("/loginctr/pwdResult.do")
					.param("emp_number", "1040")
					.param("emp_id", "loginid01")
					.param("emp_department", "인사")
					.param("emp_name", "김부장")
					.param("emp_rank", "부장"))
			.andExpect(status().isOk())
			.andExpect((ResultMatcher) content().string("emp_pwd"));
		}
	
	
	
	
	
	
	
	
	
	
}
