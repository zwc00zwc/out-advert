package com.outad.dao;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.MybatisProperties;
import org.mybatis.spring.boot.autoconfigure.SpringBootVFS;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.ObjectUtils;
import org.springframework.util.StringUtils;

import javax.sql.DataSource;

/**
 * @Author: siskin_zh
 * @Date: 2020 2020-08-06 11:23
 */
@Configuration
@EnableTransactionManagement(proxyTargetClass = true)
@MapperScan(basePackages = "com.outad.dao.mapper", sqlSessionTemplateRef = "sqlSessionTemplate")
public class MybatisConfig {
    private static final String MYBATIS_PREFIX = "mybatis";
    private static final String DATASOURCE_PREFIX = MYBATIS_PREFIX + ".datasource";


    @Bean
    @Primary
    @ConfigurationProperties(MYBATIS_PREFIX)
    public MybatisProperties mybatisProperties() {
        return new MybatisProperties();
    }

    @Bean
    @ConfigurationProperties(DATASOURCE_PREFIX)
    DataSource dataSource() throws Throwable {
        return DruidDataSourceBuilder.create().build();
    }

    @Bean
    public PlatformTransactionManager ucTransactionManager() throws Throwable {
        return new DataSourceTransactionManager(dataSource());
    }

    @Bean
    public TransactionTemplate ucTransactionTemplate() throws Throwable {
        return new TransactionTemplate(ucTransactionManager());
    }

    @Bean
    public SqlSessionFactory ucSqlSessionFactory() throws Throwable {
        DataSource dataSource = dataSource();
        MybatisProperties properties = mybatisProperties();

        SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
        factory.setDataSource(dataSource);
        factory.setVfs(SpringBootVFS.class);
        if (!ObjectUtils.isEmpty(properties.resolveMapperLocations())) {
            factory.setMapperLocations(properties.resolveMapperLocations());
        }

        if (StringUtils.hasLength(properties.getTypeAliasesPackage())) {
            factory.setTypeAliasesPackage(properties.getTypeAliasesPackage());
        }

        if (StringUtils.hasLength(properties.getTypeHandlersPackage())) {
            factory.setTypeHandlersPackage(properties.getTypeHandlersPackage());
        }

        return factory.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate() throws Throwable {
        return new SqlSessionTemplate(ucSqlSessionFactory());
    }
}
