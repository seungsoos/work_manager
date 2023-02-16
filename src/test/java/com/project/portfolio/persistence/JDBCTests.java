package com.project.portfolio.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	@Test
	public void testConnection() {
		try {
		     Class.forName("org.mariadb.jdbc.Driver");
		     
		     Connection conn = DriverManager.getConnection(
		    		 "jdbc:mariadb://localhost:3306/company","root","1234");
		     
		     log.info(conn);
		     conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
