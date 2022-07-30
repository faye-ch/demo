package com.faye.demo.datasource.dbswitch;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
import java.util.Map;
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
