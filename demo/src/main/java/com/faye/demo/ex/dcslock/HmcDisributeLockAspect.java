package com.faye.demo.ex.dcslock;

import com.google.common.primitives.Ints;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/*
 * @Author cyf
 * 分布式锁
 *
 **/
@Aspect
@Slf4j
public class HmcDisributeLockAspect {

    @Pointcut("@annotation(com.faye.demo.ex.dcslock.HmcDistributeLock)")
    public void pointcut(){

    }

    @Around(value = "pointcut() && @annotation(annotation)")
    public Object around(ProceedingJoinPoint joinPoint,HmcDistributeLock annotation) throws Throwable{
        //锁名称
        String key = this.buildLockKey(joinPoint, annotation);
        log.debug("Lock ---> 请求锁【{}】",key);
        boolean success = false;
        //加分布式锁
        //RedisLock redisLock = RedisMutexLock.build(key);
        //success = redisLock.tryLock();
        if (!success){
            //获取分布式锁-失败处理
            String message = annotation.message();
            this.lockFailHandle(key,message);
        }
        try{
            //成功获取锁 执行切入点方法
            return joinPoint.proceed();
        }finally {
            //执行完目标方法后释放分布式锁
            //redisLock.unlock()
            log.debug("LOCK 释放锁 ---> [{}]",key);
        }
    }

    /**
     * 构建锁名称
     * @param joinPoint
     * @param annotation
     * @return
     */
    private String buildLockKey(ProceedingJoinPoint joinPoint,HmcDistributeLock annotation){
        int[] argsIndex = annotation.argsIndexe();
        StringBuilder keyStrBuilder = new StringBuilder(annotation.value());
        //获取切入点方法的参数值
        if (argsIndex.length > 0 ){
            Object[] paramValues = joinPoint.getArgs();
            Ints.asList(argsIndex).stream().map(i -> paramValues[i]).forEach(v -> keyStrBuilder.append("_").append(v));
        }
        return keyStrBuilder.toString();
    }

    private void lockFailHandle(String key , String errorMsg){
        if (Strings.isNotBlank(errorMsg)){
            errorMsg = "获取分布式锁失败"+key;
        }
        throw new RuntimeException(errorMsg);
    }

}
