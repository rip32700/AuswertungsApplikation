package com.phoebus.abfragen.config;


import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.TaskExecutor;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import com.phoebus.abfragen.persistence.QueryRepository;
import com.phoebus.abfragen.persistence.QueryRepositoryImpl;

@Configuration
//@EnableAsync
//@EnableScheduling
@ComponentScan( {"com.phoebus.abfragen.service" })
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
	
//	@Bean
//	public TaskExecutor taskExecutor() {
//		ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
//		executor.setCorePoolSize(5);
//		executor.setMaxPoolSize(10);
//		executor.setQueueCapacity(25);
//		return executor;
//	}
	
}
