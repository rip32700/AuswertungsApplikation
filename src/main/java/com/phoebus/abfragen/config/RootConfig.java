package com.phoebus.abfragen.config;


import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.phoebus.abfragen.repository.BoundVariableRepository;
import com.phoebus.abfragen.repository.BoundVariableRepositoryImpl;
import com.phoebus.abfragen.repository.QueryRepository;
import com.phoebus.abfragen.repository.QueryRepositoryImpl;

@Configuration
@ComponentScan( {"com.phoebus.abfragen.service", "com.phoebus.abfragen.config" })
public class RootConfig {

	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@telisdb5:1521:tel1");
		ds.setUsername("t20");
		ds.setPassword("ad01yoda");
		return ds;
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate(DataSource dataSource) {
		return new JdbcTemplate(dataSource);
	}
	
	@Bean
	public QueryRepository queryRepository(JdbcOperations jdbcOperations) {
		return new QueryRepositoryImpl(jdbcOperations);
	}
	
	@Bean
	public BoundVariableRepository boundVariableRepository(JdbcOperations jdbcOperations) {
		return new BoundVariableRepositoryImpl(jdbcOperations);
	}
}
