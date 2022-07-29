package com.faye.demo.datasource.dbswitch;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * <br>==========================
 * <br> 公司：广州向日葵信息科技有限公司
 * <br> 开发：chenyunfei@xiangrikui.com
 * <br> 创建时间：
 * <br> 版本：1.0
 * <br> JDK版本：1.8
 * <br>==========================
 */
@Aspect
@Component
public class DbAop {
    
    @Pointcut("@annotation(com.faye.demo.datasource.dbswitch.Db)")
    public void poitcut(){}
    
    @Around(value = "poitcut() && @annotation(annotation)")
    public void around(ProceedingJoinPoint point, Db annotation)throws Throwable{
        String dbName = annotation.value();
        if (dbName==null){
            DynamicDb.setDb(DbType.MASTER);
        }else {
            DynamicDb.setDb(dbName);
        }
        try {
            point.proceed();
        } finally {
            DynamicDb.clear();
        }
    }
    
    
}
