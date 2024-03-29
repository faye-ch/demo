package com.faye.demo;

import com.faye.demo.datasource.dbswitch.DbConfig;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.Import;


@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
@Import(DbConfig.class)
@MapperScan("com.faye.demo.datasource.dao")
public class DemoApplication {
    public static void main(String[] args) { 
        SpringApplication.run(DemoApplication.class, args);
    }

}
