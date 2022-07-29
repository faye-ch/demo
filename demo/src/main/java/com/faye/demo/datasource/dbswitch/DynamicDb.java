package com.faye.demo.datasource.dbswitch;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
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
public class DynamicDb extends AbstractRoutingDataSource {
    
    private static final ThreadLocal<String> CONTEXT = new ThreadLocal<>();
    
    public DynamicDb(DataSource dataSource, Map<Object,Object> map){
        super.setDefaultTargetDataSource(dataSource);
        super.setTargetDataSources(map);
        super.afterPropertiesSet();
    }

    @Override
    protected Object determineCurrentLookupKey() {
        return getDb();
    }
    
    public static String getDb(){
        return CONTEXT.get();
    }
    
    public static void setDb(String db){
        CONTEXT.set(db);
    }
    
    public static void clear(){
        CONTEXT.remove();
    }
}
