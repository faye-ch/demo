package com.faye.demo.datasource.dbswitch;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.Ordered;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

@Aspect
@Component
public class DbAop {
    
    @Pointcut("@annotation(com.faye.demo.datasource.dbswitch.Db)")
    public void poitcut(){}
    
    @Around(value = "poitcut() && @annotation(annotation)")
    public Object around(ProceedingJoinPoint point, Db annotation)throws Throwable{
        String dbName = annotation.value();
        if (dbName==null){
            DynamicDb.setDb(DbType.MASTER);
        }else {
            DynamicDb.setDb(dbName);
        }
        try {
            return point.proceed();
        } finally {
            DynamicDb.clear();
        }
    }
    
    
}
