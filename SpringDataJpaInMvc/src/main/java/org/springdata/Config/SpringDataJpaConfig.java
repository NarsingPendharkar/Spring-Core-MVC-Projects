package org.springdata.Config;

import java.util.Properties;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import jakarta.persistence.EntityManagerFactory;

@Configuration
@EnableTransactionManagement
@EnableJpaRepositories(basePackages = "org.springdata")
public class SpringDataJpaConfig {

	// define database connection using datasource

	@Bean
	public DataSource databaseconnection() {
		DriverManagerDataSource conn = new DriverManagerDataSource();
		conn.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn.setUrl("jdbc:sqlserver://DESKTOP-G774017:1433;databaseName=test;encrypt=false");
		conn.setUsername("Narsing");
		conn.setPassword("root");
		return conn;
	}
	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean factory=new LocalContainerEntityManagerFactoryBean();
		factory.setDataSource(databaseconnection());
		factory.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
		factory.setPackagesToScan("org.springdata");
		Properties jpaProperties=new Properties();
		jpaProperties.put("hibernate.hbm2ddl.auto", "update");
	    jpaProperties.put("hibernate.show_sql", "true");
	    jpaProperties.put("hibernate.format_sql", "true");
	    factory.setJpaProperties(jpaProperties);
		return factory;
	}
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory ) {
		return new JpaTransactionManager(entityManagerFactory);
	}

}
