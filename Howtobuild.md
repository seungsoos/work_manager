## Usage

 ### root-context.xml
 <bean id="hikariConfig" class="com.zaxxer.hikari.HikariConfig">
		<property name="driverClassName"
			value="net.sf.log4jdbc.sql.jdbcapi.DriverSpy"></property>
		<property name="jdbcUrl"
			value="jdbc:log4jdbc:mariadb://localhost:3306/company"></property> 
		<property name="username" value="USERNAME"></property>
		<property name="password" value="PASSWORD"></property>
	</bean>	
