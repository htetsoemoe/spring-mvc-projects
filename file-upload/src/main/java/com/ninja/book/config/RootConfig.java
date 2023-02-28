package com.ninja.book.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;

@Configuration
@ComponentScan("com.ninja.book.root")
public class RootConfig {
	
	@Bean
	public DataSource dataSource() {
		var ds = new BasicDataSource();
		ds.setUrl("jdbc:mysql://localhost:3306/books_db");
		ds.setUsername("root");
		ds.setPassword("admin");
		
		return ds;
	}
	
	@Bean
	public NamedParameterJdbcTemplate namedJdbcTemplate(DataSource dataSource) {
		return new NamedParameterJdbcTemplate(dataSource);
	}
	
	@Bean
	@Scope("prototype")
	public SimpleJdbcInsert jdbcInsert(DataSource dataSource) {
		return new SimpleJdbcInsert(dataSource);
	}
	

}
