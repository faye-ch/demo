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

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
@Configuration
public class DbConfig {
    
    @Bean(name = "masterDB")
    @ConfigurationProperties("spring.datasource.druid.master")
    public DataSource masterDb(){
        return DruidDataSourceBuilder.create().build();
    }

    @Bean(name = "slave")
    @ConfigurationProperties("spring.datasource.druid.slave")
    public DataSource slaveDb(){
        return DruidDataSourceBuilder.create().build();
    }
    
    @Bean
    @Primary
    public DynamicDb dataSource(DataSource masterDb,DataSource slaveDb ){
        Map<Object,Object> map = new HashMap<>();
        map.put(DbType.MASTER,masterDb);
        map.put(DbType.SLAVE,slaveDb);
        return new DynamicDb(masterDb,map);
    }
    
}
