package com.faye.demo.datasource.dbswitch;

import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceBuilder;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;

import javax.sql.DataSource;
import java.beans.ConstructorProperties;
import java.util.HashMap;
import java.util.Map;

@Configuration
public class DbConfig {
    
    @Bean
    @ConfigurationProperties("spring.datasource.druid.master")
    public DataSource masterDb(){
        return DruidDataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties("spring.datasource.druid.slave")
    public DataSource slaveDb(){
        return DruidDataSourceBuilder.create().build();
    }
    
    @Bean
    @Primary
    public DynamicDb dataSource(DataSource masterDb,DataSource slaveDb){
        Map<Object,Object> map = new HashMap<>(5);
        map.put(DbType.MASTER,masterDb);
        map.put(DbType.SLAVE,slaveDb);
        return new DynamicDb(masterDb,map);
    }
    
}
