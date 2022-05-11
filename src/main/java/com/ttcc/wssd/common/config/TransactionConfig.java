package com.ttcc.wssd.common.config;

import com.zaxxer.hikari.HikariDataSource;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;

/**
 * @brief main db mybatis 연결설정
 */
@Configuration
@EnableTransactionManagement
public class TransactionConfig
{
	@Bean
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource mainDataSource() {
		HikariDataSource ds = (HikariDataSource) DataSourceBuilder.create().build();
		ds.setConnectionTestQuery("SELECT 1");		
		return ds;
	}

	@Bean
	public SqlSessionFactory mainMybatisSqlSessionFactory(
			@Qualifier("mainDataSource") DataSource mainDataSource,
			ApplicationContext applicationContext) throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(mainDataSource);
		sqlSessionFactoryBean.setMapperLocations(applicationContext.getResources("classpath:com/ttcc/wssd/**/*.xml"));
		Resource myBatisConfig = new PathMatchingResourcePatternResolver().getResource("classpath:mybatis-config.xml");		// mybatis - camel로 그대로 가져오기
		sqlSessionFactoryBean.setConfigLocation(myBatisConfig);
		SqlSessionFactory sqlSessionFactory = sqlSessionFactoryBean.getObject();
		// sqlSessionFactory.getConfiguration().setCallSettersOnNulls(true);

		return sqlSessionFactoryBean.getObject();
	}

	@Bean(name = "mainSession")
	public SqlSessionTemplate mainMybatisSqlSessionTemplate(@Qualifier("mainMybatisSqlSessionFactory") SqlSessionFactory mainMybatisSqlSessionFactory) throws Exception {
		return new SqlSessionTemplate(mainMybatisSqlSessionFactory);
	}

	@Primary
	@Bean
	public PlatformTransactionManager mainTxManager(DataSource mainDataSource) {
		return new DataSourceTransactionManager(mainDataSource);
	}

}


